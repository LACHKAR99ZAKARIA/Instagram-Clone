//
//  FeedViewModel.swift
//  InstagramClone
//
//  Created by Zakarai Lachkar on 28/9/2023.
//

import Foundation
import Firebase
import FirebaseFirestore

class FeedViewModel: ObservableObject {
    @Published var posts = [Post]()
    
    init() {
        Task { try await featchPost() }
    }
    
    @MainActor
    func featchPost() async throws {
        self.posts = try await PostService.fetchAllPost()
    }
}
