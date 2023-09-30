//
//  FeedView.swift
//  InstagramClone
//
//  Created by Zakarai Lachkar on 25/9/2023.
//

import SwiftUI

struct FeedView: View {
    @StateObject var viewModel = FeedViewModel()
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 32,content: {
                    ForEach(viewModel.posts) { post in
                        FeedCell(post: post)
                    }
                })
                .padding(.top, 8)
            }
            .refreshable {
                Task { try await viewModel.featchPost() }
            }
            .navigationTitle("Feed")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading) {
                    Image(.logo)
                        .resizable()
                        .frame(width: 100, height: 32)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "paperplane")
                        .imageScale(.large)
                }
            }
        }
        .onAppear{
            Task { try await viewModel.featchPost() }
        }
    }
}

#Preview {
    FeedView()
}
