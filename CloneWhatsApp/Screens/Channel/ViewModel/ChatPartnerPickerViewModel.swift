//
//  ChatPartnerPickerViewModel.swift
//  CloneWhatsApp
//
//  Created by Abdulsamet Göçmen on 30.12.2024.
//

import Foundation

enum ChannelCreationRoute {
    case groupPartnerPicker
    case setUpGroupChat
}

enum ChannelConstans {
    static let maxGroupParticipants = 12
}

@MainActor
final class ChatPartnerPickerViewModel: ObservableObject {
    @Published var navStack = [ChannelCreationRoute]()
    @Published var selectedChatPartners = [UserItem]()
    @Published private(set) var users = [UserItem]()
    private var lastCursor: String?
    var showSelectedUsers: Bool {
        return !selectedChatPartners.isEmpty
    }
    
    var disableNextButton: Bool {
        return selectedChatPartners.isEmpty
    }
    
    var isPaginatable: Bool {
        return !users.isEmpty
    }
    
    init() {
        Task{
            await fetchUsers()
        }
    }
    
    
    // MARK: Public Methods
    func fetchUsers() async {
        do {
            let userNode = try await UserService.paginateUsers(lastCursor: lastCursor, pageSize: 5)
            self.users.append(contentsOf: userNode.users)
            self.lastCursor = userNode.currenCursor
            print("lastCursor: \(lastCursor) \(users.count)")
        } catch {
            print("💾 Failed to fetch isers in ChatPartnerPickerViewModel")
        }
    }
    func handleItemSelection(_ item: UserItem) {
        if isUserSelected(item)
        {
            guard let index = selectedChatPartners.firstIndex(where: { $0.uid == item.uid }) else { return }
            selectedChatPartners.remove(at: index)
        }
        else
        {
            selectedChatPartners.append(item)
        }
    }
    
    func isUserSelected(_ user: UserItem) -> Bool {
        let isSelected = selectedChatPartners.contains{ $0.uid == user.uid }
        return isSelected
    }
}
