//
//  UploadPostViewModel.swift
//  InstagramClone
//
//  Created by Zakarai Lachkar on 26/9/2023.
//

import SwiftUI
import PhotosUI

@MainActor
class UploadPostViewModel: ObservableObject {
    
    @Published var selectedImg: PhotosPickerItem? {
        didSet {Task {await loadImg(fromItem: selectedImg)}}
    }
    @Published var profileImg: Image?
    func loadImg(fromItem item: PhotosPickerItem?) async {
        guard let item = item else { return }
        
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else {return}
        self.profileImg = Image(uiImage: uiImage)
    }
}
