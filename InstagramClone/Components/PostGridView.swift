//
//  PostGridView.swift
//  InstagramClone
//
//  Created by Zakarai Lachkar on 26/9/2023.
//

import SwiftUI

struct PostGridView: View {
    var posts: [Post]
    private let grideItems: [GridItem] = [
        .init(.flexible(),  spacing: 1),
        .init(.flexible(),  spacing: 1),
        .init(.flexible(),  spacing: 1),
    ]
    private let imgDimension: CGFloat = (UIScreen.main.bounds.width / 3) - 1
    var body: some View {
        LazyVGrid(columns: grideItems, spacing: 1, content: {
            ForEach(posts) { post in
                Image(post.imgUrl)
                    .resizable()
                    .scaledToFill()
                    .frame(width: imgDimension, height: imgDimension)
                    .clipped()
            }
        })
    }
}

#Preview {
    PostGridView(posts: Post.MOCK_POSTS)
}
