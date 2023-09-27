//
//  ContentViewModel.swift
//  InstagramClone
//
//  Created by Zakarai Lachkar on 26/9/2023.
//

import Foundation
import Combine
import FirebaseAuth
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

@MainActor
class ContentViewModel: ObservableObject {
    private let service = AuthService.shared
    private var cancelables = Set<AnyCancellable>()
    @Published var userSession:  FirebaseAuth.User?
    @Published var currentUser:  User?
    
    init() {
        setupSubscribers()
    }
    func setupSubscribers() {
        service.$userSession.sink { [weak self] userSession in
            self?.userSession = userSession
        }
        .store(in: &cancelables)
        
        service.$currentUser.sink { [weak self] currentUser in
            self?.currentUser = currentUser
        }
        .store(in: &cancelables)
    }
}
