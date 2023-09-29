//
//  PostGridViewModel.swift
//  InstagramClone
//
//  Created by Zakarai Lachkar on 29/9/2023.
//

import Foundation

class PostGridViewModel: ObservableObject {
    private var user: User
    @Published var posts = [Post]()
    init(user: User) {
        self.user = user
        Task { try await fetchUserPost() }
    }
    
    @MainActor
    func fetchUserPost() async throws {
        self.posts = try await PostService.fetchUserPost(uid: user.id)
        for i in 0 ..< posts.count {
            posts[i].user = self.user
        }
    }
}
