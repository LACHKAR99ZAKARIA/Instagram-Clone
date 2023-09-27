//
//  AuthService.swift
//  InstagramClone
//
//  Created by Zakarai Lachkar on 26/9/2023.
//

import Foundation
import FirebaseAuth
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

@MainActor
class AuthService {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    static let shared = AuthService()
    
    init() {
        self.userSession = Auth.auth().currentUser
        Task { try await loadUserData() }
    }
    
    func login(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            try await loadUserData()
        } catch {
            print("Debug Failed to loIn with user \(error.localizedDescription)")
        }
    }
    func createUser(email: String, password: String, username: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            await self.uploadUserData(uid: result.user.uid, username: username, email: email)
        } catch {
            print("Debug Failed to register with user \(error.localizedDescription)")
        }
    }
    func loadUserData() async throws {
        guard let currentUid = self.userSession?.uid else { return }
        let snapshot = try await Firestore.firestore().collection("users").document(currentUid).getDocument()
        print(snapshot.data())
        
        self.currentUser = try? snapshot.data(as: User.self)
    }
    func signOut() {
        try? Auth.auth().signOut()
        self.userSession = nil
        self.currentUser = nil
    }
    private func uploadUserData(uid: String, username: String, email: String) async {
        let user = User(id: uid, username: username, email: email) 
        guard let encodedUser = try? Firestore.Encoder().encode(user) else { return }
        self.currentUser = user
        try? await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
    }
}
