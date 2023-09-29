//
//  ImageUploader.swift
//  InstagramClone
//
//  Created by Zakarai Lachkar on 28/9/2023.
//

import UIKit
import Firebase
import FirebaseStorage

struct ImageUploader {
    static func uploadImage(image: UIImage) async throws -> String? {
        let filename = NSUUID().uuidString
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return nil }
        let ref = Storage.storage().reference(withPath: "/profile_images/\(filename)")
        
        do {
            let _ = try await ref.putDataAsync(imageData)
            let url = try await ref.downloadURL()
            return url.absoluteString
        } catch {
            print("Debig: Fail to upload Image to firebase \(error)")
            return nil
        }
    }
}
