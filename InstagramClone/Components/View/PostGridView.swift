//
//  PostGridView.swift
//  InstagramClone
//
//  Created by Zakarai Lachkar on 26/9/2023.
//

import SwiftUI
import Kingfisher

struct PostGridView: View {
    @StateObject var viewModel: PostGridViewModel
    init(user: User) {
        self._viewModel = StateObject(wrappedValue: PostGridViewModel(user: user))
    }
    private let grideItems: [GridItem] = [
        .init(.flexible(),  spacing: 1),
        .init(.flexible(),  spacing: 1),
        .init(.flexible(),  spacing: 1),
    ]
    private let imgDimension: CGFloat = (UIScreen.main.bounds.width / 3) - 1
    var body: some View {
        LazyVGrid(columns: grideItems, spacing: 1, content: {
            ForEach(viewModel.posts) { post in
                KFImage(URL(string: post.imgUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: imgDimension, height: imgDimension)
                    .clipped()
            }
        })
    }
}

#Preview {
    PostGridView(user: User.MOCK_USERS[0])
}
