//
//  EditProfileViewModel.swift
//  InstagramClone
//
//  Created by Zakarai Lachkar on 28/9/2023.
//

import SwiftUI
import PhotosUI
import Firebase

@MainActor
class EditProfileViewModel: ObservableObject  {
    @Published var user: User
    @Published var selectedImg: PhotosPickerItem? {
        didSet {Task {await loadImg(fromItem: selectedImg)}}
    }
    @Published var profileImg: Image?
    @Published var fullname = ""
    @Published var bio = ""
    private var uiImage: UIImage?
    init(user: User) {
        self.user = user
        if let fullname = user.fullname {
            self.fullname = fullname
        }
        if let bio = user.bio {
            self.bio = bio
        }
    }
    func loadImg(fromItem item: PhotosPickerItem?) async {
        guard let item = item else { return }
        
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else {return}
        self.uiImage = uiImage
        self.profileImg = Image(uiImage: uiImage)
    }
    func updateUserData() async throws {
        var data = [String: Any]()
        if let uiImage = self.uiImage {
            let imgUrl = try await ImageUploader.uploadImage(image: uiImage)
            data["profileImageUrl"] = imgUrl
        }
        if !fullname.isEmpty && user.fullname != fullname {
            user.fullname = fullname
            data["fullname"] = fullname
        }
        if !bio.isEmpty && user.bio != bio {
            user.bio = bio
            data["bio"] = bio
        }
        if !data.isEmpty {
            try await Firestore.firestore().collection("users").document(user.id).updateData(data)
            try await AuthService.shared.loadUserData()
        }
    }
}
