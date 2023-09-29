//
//  PostService.swift
//  InstagramClone
//
//  Created by Zakarai Lachkar on 28/9/2023.
//

import SwiftUI
import Firebase
import FirebaseFirestore

struct PostService {
    private static var postCollection = Firestore.firestore().collection("posts")
    static func fetchAllPost() async throws -> [Post] {
        let snapshot = try await postCollection.getDocuments()
//        self.posts = snapshot.documents.compactMap({ document in
//            let post = try? document.data(as: Post.self)
//            return post
//        })
        var posts = try snapshot.documents.compactMap({ try $0.data(as: Post.self) })
        for i in 0 ..< posts.count {
            let post = posts[i]
            let ownerUid = post.owner
            let postUser = try await UserService.featchUser(with: ownerUid)
            posts[i].user = postUser
        }
        return posts
    }
    static func fetchUserPost(uid: String) async throws -> [Post] {
//        let snapshot = try await Firestore.firestore().collection("posts").document(uid).getDocument()
////        self.posts = snapshot.documents.compactMap({ document in
////            let post = try? document.data(as: Post.self)
////            return post
////        })
////        var posts = try snapshot.documents.compactMap({ try $0.data(as: Post.self) })
//        var posts = try snapshot.data(as: [Post].self)
//        for i in 0 ..< posts.count {
//            let post = posts[i]
//            let ownerUid = post.owner
//            let postUser = try await UserService.featchUser(with: ownerUid)
//            posts[i].user = postUser
//        }
//        return posts
        
        // OR
        
        let snapshot = try await postCollection.whereField("owner", isEqualTo: uid).getDocuments()
        return try snapshot.documents.compactMap({ try $0.data(as: Post.self) })
    }
}
