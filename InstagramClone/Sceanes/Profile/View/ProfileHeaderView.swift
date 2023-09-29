//
//  ProfileHeaderView.swift
//  InstagramClone
//
//  Created by Zakarai Lachkar on 26/9/2023.
//

import SwiftUI

struct ProfileHeaderView: View {
    let user: User
    @State var showEditProfile = false
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                CircilerProfileImageView(user: user, size: .large)
                Spacer()
                HStack(spacing: 8, content: {
                    UserStatView(value: 3, title: "Posts")
                    UserStatView(value: 38, title: "Followers")
                    UserStatView(value: 42, title: "Following")
                })
            }
            .padding(.horizontal)
            VStack(alignment: .leading, spacing: 4) {
                Text(user.username)
                    .font(.footnote)
                    .fontWeight(.bold)
                if let fullname = user.fullname {
                    Text(fullname)
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
                if let bio = user.bio {
                    Text(bio)
                        .font(.footnote)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            Button {
                if user.isCurrentUser {
                    showEditProfile.toggle()
                } else {
                    print("follow user")
                }
            } label: {
                Text(user.isCurrentUser ? "Edit Profile" : "Follow")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 360, height: 32)
                    .background(user.isCurrentUser ? .white : Color(.systemBlue))
                    .foregroundColor(user.isCurrentUser ? .black : .white)
                    .cornerRadius(6)
                    .overlay {
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(user.isCurrentUser ? .gray : .clear, lineWidth: 1)
                    }
            }

            Divider()
        }
        .fullScreenCover(isPresented: $showEditProfile, content: {
            EditProfileView(user: user)
        })
    }
}

#Preview {
    ProfileHeaderView(user: User.MOCK_USERS[0])
}
