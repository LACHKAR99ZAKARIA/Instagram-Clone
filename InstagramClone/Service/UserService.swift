//
//  UserService.swift
//  InstagramClone
//
//  Created by Zakarai Lachkar on 28/9/2023.
//

import Foundation
import Firebase
import FirebaseFirestore

class UserService {
    
    static func featchUser(with uid: String) async throws -> User {
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        
        return try snapshot.data(as: User.self)
    }
    static func feachAllUsers() async throws -> [User] {
//        var users = [User]()
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        let documents = snapshot.documents
        
//        for doc in documents {
//            guard let user = try? doc.data(as: User.self) else { return users }
//            users.append(user)
//        }
        return snapshot.documents.compactMap({ try? $0.data(as: User.self) })
    }
}
