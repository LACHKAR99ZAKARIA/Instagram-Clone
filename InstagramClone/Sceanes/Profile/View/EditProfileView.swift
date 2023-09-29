//
//  EditProfileView.swift
//  InstagramClone
//
//  Created by Zakarai Lachkar on 28/9/2023.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel: EditProfileViewModel
    init(user: User) {
        self._viewModel = StateObject(wrappedValue: EditProfileViewModel(user: user))
    }
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Button("cancel") {
                        dismiss()
                    }
                    Spacer()
                    Text("Edit Profile")
                        .font(.footnote)
                        .fontWeight(.semibold)
                    Spacer()
                    Button {
                        Task {
                            try await viewModel.updateUserData()
                            dismiss()
                        }
                    } label: {
                        Text("Done")
                            .font(.footnote)
                            .fontWeight(.semibold)
                    }
                }
                .padding()
                Divider()
            }
            PhotosPicker(selection: $viewModel.selectedImg){
                VStack{
                    if let img = viewModel.profileImg {
                        img
                            .resizable()
                            .clipShape(Circle())
                            .frame(width: 80, height: 80)
                    } else {
                        CircilerProfileImageView(user: viewModel.user, size: .medium)
                    }
                    Text("Edit profile picture")
                        .font(.footnote)
                        .fontWeight(.semibold)
                    Divider()
                }
                .padding(.vertical, 8)
            }
            VStack {
                EditProfileRowView(title: "Name", placeHolder: "Enter your fullname", text: $viewModel.fullname)
                EditProfileRowView(title: "bio", placeHolder: "Enter your bio", text: $viewModel.bio)
            }
            .padding(.horizontal)
            Spacer()
        }
    }
}

struct EditProfileRowView: View {
    let title: String
    let placeHolder: String
    @Binding var text: String
    var body: some View {
        HStack(content: {
            Text(title)
                .padding(.leading, 8)
                .frame(width: 100, alignment: .leading)
            VStack {
                TextField(placeHolder, text: $text)
                Divider()
            }
        })
        .font(.subheadline)
        .frame(height: 36)
    }
}

#Preview {
    EditProfileView(user: User.MOCK_USERS[0])
}
