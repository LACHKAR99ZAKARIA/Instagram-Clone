//
//  PostImageView.swift
//  InstagramClone
//
//  Created by Zakarai Lachkar on 28/9/2023.
//

import SwiftUI
import Kingfisher

struct PostImageRectagleView: View {
    let post: Post
    var body: some View {
        if post.imgUrl != "" {
            KFImage(URL(string: post.imgUrl))
                .resizable()
                .scaledToFit()
                .clipShape(Rectangle())
        }
    }
}

#Preview {
    PostImageRectagleView(post: Post.MOCK_POSTS[0])
}
