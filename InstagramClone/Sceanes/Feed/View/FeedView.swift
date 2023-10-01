//
//  FeedView.swift
//  InstagramClone
//
//  Created by Zakarai Lachkar on 25/9/2023.
//

import SwiftUI
import SwiftUIPager

struct FeedView: View {
    @StateObject var feedViewModel = FeedViewModel()
    @State var page: Int = 0
    func navigationTitle() -> String {
           if page == 0 {
               return "Feed"
           } else if page == 1 {
               return ""
           }
           else {
               return ""
           }
       }
//    // Helper function to conditionally apply .searchable modifier
//    @ViewBuilder
//    private func navBar() -> some View {
//        if page == 0 {
//            Spacer() // A filler view that is searchable
//                .navigationTitle("Feed")
//                .navigationBarTitleDisplayMode(.inline)
//                .toolbar {
//                    ToolbarItem(placement: .navigationBarLeading) {
//                        Image(.logo)
//                            .resizable()
//                            .frame(width: 100, height: 32)
//                    }
//                    ToolbarItem(placement: .navigationBarTrailing) {
//                        Image(systemName: "paperplane")
//                        .imageScale(.large)
//                        .onTapGesture {
//                            withAnimation {
//                                page = 1
//                            }
//                        }
//                    }
//                }
//        } else if page == 1 {
//            Spacer()
//                .toolbar {
//                    ToolbarItem(placement: .navigationBarLeading) {
//                        HStack {
//                            Image(systemName: "chevron.left")
//                                .onTapGesture {
//                                    withAnimation {
//                                        page = 0
//                                    }
//                                }
//                            HStack{
//                                Text("zakaria.lachkar")
//                                    .font(.title2)
//                                Image(systemName: "chevron.down")
//                                    .font(.system(size: 15))
//                            }
//                            .fontWeight(.semibold)
//                        }
//                    }
//                }
//        }
//    }
    func pageView(_ page: Int) -> some View {
        switch page {
        case 0: return AnyView(
            feed
        )
        case 1: return AnyView(DiscutionsView(page: $page))
        default: return AnyView(Text("Discussions"))
        }
    }
    var body: some View {
            let pageBinding = Page.withIndex(page)
            Pager(page: pageBinding, data: [0, 1], id: \.self) {
                self.pageView($0)
            }
//            .background(navBar())
//        .tabViewStyle(.page(indexDisplayMode: .always))
    }
    var feed: some View {
        VStack {
            NavigationStack {
                ScrollView {
                    LazyVStack(spacing: 32,content: {
                        ForEach(feedViewModel.posts) { post in
                            FeedCell(post: post)
                        }
                    })
                    .padding(.top, 8)
                }
                .refreshable {
                    Task { try await feedViewModel.featchPost() }
                }
                .navigationTitle("Feed")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Image(.logo)
                            .resizable()
                            .frame(width: 100, height: 32)
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Image(systemName: "paperplane")
                        .imageScale(.large)
                        .onTapGesture {
                            withAnimation {
                                page = 1
                            }
                        }
                    }
                }
            }
            .onAppear{
                Task { try await feedViewModel.featchPost() }
        }
        }
    }
}

#Preview {
    FeedView()
}
