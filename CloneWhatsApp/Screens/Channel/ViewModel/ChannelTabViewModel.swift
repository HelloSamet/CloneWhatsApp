//
//  ChannelTabViewModel.swift
//  CloneWhatsApp
//
//  Created by Abdulsamet Göçmen on 2.01.2025.
//

import Foundation
import FirebaseAuth

enum ChannelTabRoutes: Hashable {
    case chatRoom(_ channel: ChannelItem)
}

final class ChannelTabViewModel: ObservableObject {
    
    @Published var navRoutes = [ChannelTabRoutes]()
    @Published var navigateToChatRoom = false
    @Published var newChannel: ChannelItem?
    @Published var showChatPartnerPickerView = false
    @Published var channels = [ChannelItem]()
    typealias ChannelId = String
    @Published var channelDictionary: [ChannelId: ChannelItem] = [:]
    
    private let currentUser: UserItem
    
    init(_ currentUser: UserItem) {
        self.currentUser = currentUser
        fetchCurrentUserChannels()
    }
    
    func onNewChannelCreation(_ channel: ChannelItem) {
        showChatPartnerPickerView = false
        newChannel = channel
        navigateToChatRoom = true
    }
    
    private func fetchCurrentUserChannels() {
        guard let currenUid = Auth.auth().currentUser?.uid else { return }
        FirebaseConstants.UserChannelsRef.child(currenUid).observe(.value) { [weak self] snapshot in
            guard let dict = snapshot.value as? [String: Any] else { return }
            dict.forEach { key, value in
                let channelId = key
                self?.getChannel(with: channelId)
            }
        } withCancel: { error in
            print("Failed to get the current user's channelIds: \(error.localizedDescription)")
        }
    }
    
    private func getChannel(with channelId: String) {
        FirebaseConstants.ChannelsRef.child(channelId).observe(.value) {[weak self] snapshot in
            guard let dict = snapshot.value as? [String: Any], let self = self else { return }
            var channel = ChannelItem(dict)
            channel.members = []
            self.getChannelMembers(channel, completion: { members in
                channel.members = members
                if channel.isGroupChat == false {
                    channel.members.append(self.currentUser)
                }
                self.channelDictionary[channelId] = channel
                self.reloadData()
                print("channel: \(channel.title)")
            })
        } withCancel: { error in
            print("Failed to get the channel for id: \(channelId): \(error.localizedDescription)")
        }
    }
    
    private func getChannelMembers(_ channel: ChannelItem, completion: @escaping (_ members: [UserItem]) -> Void) {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        let channelMemmbersUids = Array(channel.membersUids.filter { $0 != currentUid }.prefix(2))
        UserService.getUsers(with: channelMemmbersUids, completion: { userNode in
            completion(userNode.users)
        })
    }
    
    private func reloadData() {
        self.channels = Array(channelDictionary.values)
        self.channels.sort { $0.lastMessageTimeStamp > $1.lastMessageTimeStamp }
    }
}
