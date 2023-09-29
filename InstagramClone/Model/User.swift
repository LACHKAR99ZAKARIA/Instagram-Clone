//
//  User.swift
//  InstagramClone
//
//  Created by Zakarai Lachkar on 26/9/2023.
//

import Foundation
import Firebase

struct User: Identifiable, Hashable, Codable {
    let id: String
    var username: String
    var profileImageUrl: String?
    var fullname: String?
    var bio: String?
    var email: String
    var isCurrentUser: Bool {
        guard let currentUid = Auth.auth().currentUser?.uid else { return false }
        return currentUid == id
    }
}

extension User {
    static var MOCK_USERS: [User] = [
        .init(id: NSUUID().uuidString, username: "zakaria99la", profileImageUrl: "zakarialachkarProfile", fullname: "zakaria.lachkar", bio: "zakaria lachkar", email: "lachkar99zakaria@gmail.com"),
        .init(id: NSUUID().uuidString, username: "alexandre01ra", profileImageUrl: "alexandreRibeiroProfile", fullname: "alexandre.ribeiro", bio: "alexandre ribeiro", email: "ribeiro01alexandre@gmail.com"),
        .init(id: NSUUID().uuidString, username: "marie02pa", profileImageUrl: "mariePascalProfile", fullname: "marie.pascal", bio: "marie pascal", email: "pascal02marie@gmail.com"),
        .init(id: NSUUID().uuidString, username: "antoine03le", profileImageUrl: "antoineLeclercProfile", fullname: "antoine.leclerc", bio: "antoine leclerc", email: "leclerc03antoine@gmail.com"),
        .init(id: NSUUID().uuidString, username: "sophie04de", profileImageUrl: "sophieDupontProfile", fullname: "sophie.dupont", bio: "sophie dupont", email: "dupont04sophie@gmail.com"),
        .init(id: NSUUID().uuidString, username: "lucas05bo", profileImageUrl: "lucasBourgeoisProfile", fullname: "lucas.bourgeois", bio: "lucas bourgeois", email: "bourgeois05lucas@gmail.com"),
        .init(id: NSUUID().uuidString, username: "alen199", email: "alen199@gmail.com"),
    ]
}
