//
//  SearchView.swift
//  InstagramClone
//
//  Created by Zakarai Lachkar on 25/9/2023.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var mainSwiperModel: MainViewModel
    @State private var searchText = ""
    @StateObject var viewModel = SearchViewModel()
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 12,content: {
                    ForEach(viewModel.users) { user in
                        NavigationLink(value: user) {
                            HStack {
                                CircilerProfileImageView(user: user, size: .xSmale)
                                VStack(alignment: .leading) {
                                    Text(user.username)
                                        .fontWeight(.semibold)
                                    if let fullname = user.fullname {
                                        Text(fullname)
                                    }
                                }
                                .font(.footnote)
                                Spacer()
                            }
                            .padding(.horizontal)
                        }
                    }
                })
                .padding(.top, 8)
                .searchable(text: $searchText, prompt: "Search...")
            }
            .onAppear{
                mainSwiperModel.leftView = nil
                mainSwiperModel.rightView = nil
            }
            .navigationDestination(for: User.self) { user in
                ProfileView(mainSwiperModel: mainSwiperModel, user: user)
            }
        }
        .navigationTitle("Explore")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    SearchView(mainSwiperModel: MainViewModel())
}
