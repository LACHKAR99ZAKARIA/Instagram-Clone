//
//  FeedCell.swift
//  InstagramClone
//
//  Created by Zakarai Lachkar on 25/9/2023.
//

import SwiftUI

struct FeedCell: View {
    let post: Post
    var body: some View {
        VStack {
            HStack {
                if let u = post.user {
                    NavigationLink {
                        ProfileView(user: u)
                    } label: {
                        CircilerProfileImageView(user: u, size: .xSmale)
                        Text(u.username)
                            .font(.footnote)
                            .fontWeight(.semibold)
                    }
                }
                Spacer()
            }
            .padding(.leading)
//            Image(post.imgUrl)
//                .resizable()
//                .scaledToFit()
//                .clipShape(Rectangle())
            PostImageRectagleView(post: post)
            
            HStack(spacing: 16) {
                Button {
                    print("Like")
                } label: {
                    Image(systemName: "heart")
                        .imageScale(.large)
                }
                Button {
                    print("Comment")
                } label: {
                    Image(systemName: "bubble.right")
                        .imageScale(.large)
                }
                Button {
                    print("Share")
                } label: {
                    Image(systemName: "paperplane")
                        .imageScale(.large)
                }
                Spacer()
            }
            .padding(.leading, 8)
            .padding(.top, 4)
            .foregroundColor(.black)
            
            Text("\(post.likes) Likes")
                .font(.footnote)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
                .padding(.top, 1)
            
            HStack {
                if let u = post.user {
                    Text("\(post.user!.username) ")
                            .fontWeight(.semibold)
                    Text("\(post.caption)")
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 10)
            .padding(.top, 1)
            .font(.footnote)
            
            Text("6h ago")
                .font(.footnote)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
                .padding(.top, 1)
                .foregroundColor(.gray)
        }
    }
}

#Preview {
    FeedCell(post: Post.MOCK_POSTS[0])
}
