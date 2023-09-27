//
//  ProfileHeaderView.swift
//  InstagramClone
//
//  Created by Zakarai Lachkar on 26/9/2023.
//

import SwiftUI

struct ProfileHeaderView: View {
    let user: User
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Image(user.profileImgUrl ?? "defaultprofile")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
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
                
            } label: {
                Text("Edit Profile")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 360, height: 32)
                    .foregroundStyle(.black)
                    .overlay {
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(.gray, lineWidth: 1)
                    }
            }

            Divider()
        }
    }
}

#Preview {
    ProfileHeaderView(user: User.MOCK_USERS[0])
}
