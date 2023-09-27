//
//  RegistrationViewModel.swift
//  InstagramClone
//
//  Created by Zakarai Lachkar on 26/9/2023.
//

import Foundation

class RegistationViewModel: ObservableObject {
    @Published var username = ""
    @Published var email = ""
    @Published var password = ""
    
    func createUser() async throws {
        try await AuthService.shared.createUser(email: email, password: password, username: username)
        username = ""
        email = ""
        password = ""
    }
}
