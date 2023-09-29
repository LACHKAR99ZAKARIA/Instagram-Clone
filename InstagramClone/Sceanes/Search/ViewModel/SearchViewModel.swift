//
//  SearchViewModel.swift
//  InstagramClone
//
//  Created by Zakarai Lachkar on 28/9/2023.
//

import Foundation

class SearchViewModel: ObservableObject {
    @Published var users = [User]()
    
    init() {
        Task { try await feachUsers() }
    }
    
    @MainActor
    func feachUsers() async throws {
        users = try await UserService.feachAllUsers()
    }
}
