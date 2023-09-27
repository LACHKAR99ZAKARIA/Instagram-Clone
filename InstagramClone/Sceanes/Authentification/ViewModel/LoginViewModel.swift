//
//  LoginViewModel.swift
//  InstagramClone
//
//  Created by Zakarai Lachkar on 27/9/2023.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    func signIn() async throws {
        try await AuthService.shared.login(withEmail: email, password: password)
    }
}
