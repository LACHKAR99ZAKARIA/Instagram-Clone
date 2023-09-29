//
//  UploadPostViewModel.swift
//  InstagramClone
//
//  Created by Zakarai Lachkar on 26/9/2023.
//

import SwiftUI
import PhotosUI
import Firebase
import FirebaseFirestore

@MainActor
class UploadPostViewModel: ObservableObject {
    
    @Published var selectedImg: PhotosPickerItem? {
        didSet {Task {await loadImg(fromItem: selectedImg)}}
    }
    @Published var profileImg: Image?
    private var uiImage: UIImage?
    func loadImg(fromItem item: PhotosPickerItem?) async {
        guard let item = item else { return }
        
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else {return}
        self.uiImage = uiImage
        self.profileImg = Image(uiImage: uiImage)
    }
    
    func uploadPost(caption: String) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let uiImage = self.uiImage else { return }
        let postRef = Firestore.firestore().collection("posts").document()
        guard let imgUrl = try await ImageUploader.uploadImage(image: uiImage) else { return }
        let post = Post(id: postRef.documentID, owner: uid, caption: caption, likes: 0, imgUrl: imgUrl, timestamp: Timestamp())
        guard let encoderPost = try? Firestore.Encoder().encode(post) else { return }
        try await postRef.setData(encoderPost)
    }
}
