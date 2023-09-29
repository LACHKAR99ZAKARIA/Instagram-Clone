//
//  Post.swift
//  InstagramClone
//
//  Created by Zakarai Lachkar on 26/9/2023.
//

import SwiftUI
import Firebase
import FirebaseFirestore

struct Post: Identifiable, Hashable, Codable {
    let id: String
    let owner: String
    let caption: String
    var likes: Int
    let imgUrl: String
    let timestamp: Timestamp
    var user: User?
}

extension Post {
    static var MOCK_POSTS: [Post] = [
        // Zakaria's posts
        .init(id: NSUUID().uuidString, owner: "zakaria99la", caption: "UIkit or SwiftUI?", likes: 57, imgUrl: "zakariaPost1", timestamp: Timestamp(), user: User.MOCK_USERS[0]),
        .init(id: NSUUID().uuidString, owner: "zakaria99la", caption: "", likes: 103, imgUrl: "zakariaPost2", timestamp: Timestamp(), user: User.MOCK_USERS[0]),
        .init(id: NSUUID().uuidString, owner: "zakaria99la", caption: "UIkit ...", likes: 75, imgUrl: "zakariaPost3", timestamp: Timestamp(), user: User.MOCK_USERS[0]),

        // Alexandre's posts
        .init(id: NSUUID().uuidString, owner: "alexandre01ra", caption: "Balade dans le parc.", likes: 47, imgUrl: "alexandrePost1", timestamp: Timestamp(), user: User.MOCK_USERS[1]),
        .init(id: NSUUID().uuidString, owner: "alexandre01ra", caption: "Bon week-end à tous!", likes: 89, imgUrl: "alexandrePost2", timestamp: Timestamp(), user: User.MOCK_USERS[1]),
        .init(id: NSUUID().uuidString, owner: "alexandre01ra", caption: "Découverte d'un nouveau café en ville.", likes: 64, imgUrl: "alexandrePost3", timestamp: Timestamp(), user: User.MOCK_USERS[1]),

        // Example for Marie
        .init(id: NSUUID().uuidString, owner: "marie02pa", caption: "Vue magnifique ce matin.", likes: 120, imgUrl: "mariePost1", timestamp: Timestamp(), user: User.MOCK_USERS[2]),
        .init(id: NSUUID().uuidString, owner: "marie02pa", caption: "Détente après une longue journée.", likes: 80, imgUrl: "mariePost2", timestamp: Timestamp(), user: User.MOCK_USERS[2]),
        .init(id: NSUUID().uuidString, owner: "marie02pa", caption: "Nouvelle recette de gâteau réussie!", likes: 105, imgUrl: "mariePost3", timestamp: Timestamp(), user: User.MOCK_USERS[2]),

        // Antoine's posts
        .init(id: NSUUID().uuidString, owner: "antoine03le", caption: "Excursion en montagne ce week-end!", likes: 150, imgUrl: "antoinePost1", timestamp: Timestamp(), user: User.MOCK_USERS[3]),
        .init(id: NSUUID().uuidString, owner: "antoine03le", caption: "Le coucher de soleil d'hier était incroyable.", likes: 110, imgUrl: "antoinePost2", timestamp: Timestamp(), user: User.MOCK_USERS[3]),
        .init(id: NSUUID().uuidString, owner: "antoine03le", caption: "Rencontre avec de vieux amis.", likes: 95, imgUrl: "antoinePost3", timestamp: Timestamp(), user: User.MOCK_USERS[3]),

        // Sophie's posts
        .init(id: NSUUID().uuidString, owner: "sophie04de", caption: "La vie en rose.", likes: 85, imgUrl: "sophiePost1", timestamp: Timestamp(), user: User.MOCK_USERS[4]),
        .init(id: NSUUID().uuidString, owner: "sophie04de", caption: "Nouveau livre en cours de lecture.", likes: 102, imgUrl: "sophiePost2", timestamp: Timestamp(), user: User.MOCK_USERS[4]),
        .init(id: NSUUID().uuidString, owner: "sophie04de", caption: "Atelier de poterie du samedi.", likes: 78, imgUrl: "sophiePost3", timestamp: Timestamp(), user: User.MOCK_USERS[4]),

        // Lucas's posts
        .init(id: NSUUID().uuidString, owner: "lucas05bo", caption: "Sortie vélo avec les amis.", likes: 122, imgUrl: "lucasPost1", timestamp: Timestamp(), user: User.MOCK_USERS[5]),
        .init(id: NSUUID().uuidString, owner: "lucas05bo", caption: "Petit-déjeuner gourmand.", likes: 91, imgUrl: "lucasPost2", timestamp: Timestamp(), user: User.MOCK_USERS[5]),
        .init(id: NSUUID().uuidString, owner: "lucas05bo", caption: "Visite du musée local.", likes: 107, imgUrl: "lucasPost3", timestamp: Timestamp(), user: User.MOCK_USERS[5]),

        // Alen's posts
        .init(id: NSUUID().uuidString, owner: "alen199", caption: "Nouvelles chaussures de course!", likes: 99, imgUrl: "alenPost1", timestamp: Timestamp(), user: User.MOCK_USERS[6]),
        .init(id: NSUUID().uuidString, owner: "alen199", caption: "Soirée cinéma à la maison.", likes: 104, imgUrl: "alenPost2", timestamp: Timestamp(), user: User.MOCK_USERS[6]),
        .init(id: NSUUID().uuidString, owner: "alen199", caption: "Concert live du groupe préféré!", likes: 115, imgUrl: "alenPost3", timestamp: Timestamp(), user: User.MOCK_USERS[6])
        ]
}
