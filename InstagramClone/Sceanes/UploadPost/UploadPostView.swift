//
//  UploadPostView.swift
//  InstagramClone
//
//  Created by Zakarai Lachkar on 26/9/2023.
//

import SwiftUI
import PhotosUI

struct UploadPostView: View {
    @State private var caption = ""
    @State private var imgPickerPresenter = false
    @StateObject var viewModel = UploadPostViewModel()
    @Binding var tabIndex: Int
    var body: some View {
        VStack {
            HStack {
                Button {
                    caption = ""
                    viewModel.selectedImg = nil
                    viewModel.profileImg = nil
                    tabIndex = 0
                } label: {
                    Text("Cancel")
                }
                Spacer()
                Text("New Post")
                    .fontWeight(.semibold)
                Spacer()
                Button {
                    Task {
                        try await viewModel.uploadPost(caption: caption)
                        clearPostDataAndReturnToFeed()
                    }
                } label: {
                    Text("Upload")
                        .fontWeight(.semibold)
                }
            }
            .padding(.horizontal)
            HStack {
                if let img = viewModel.profileImg {
                    img
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .clipped()
                }
                TextField("Enter your caption", text: $caption, axis: .vertical)
                
            }
            Spacer()
        }
        .onAppear{
            imgPickerPresenter.toggle()
        }
        .photosPicker(isPresented: $imgPickerPresenter, selection: $viewModel.selectedImg)
    }
    func clearPostDataAndReturnToFeed() {
        caption = ""
        viewModel.selectedImg = nil
        viewModel.profileImg = nil
        tabIndex = 0
    }
}

#Preview {
    UploadPostView(tabIndex: .constant(3))
}
