//
//  FeedView.swift
//  InstagramClone
//
//  Created by Zakarai Lachkar on 25/9/2023.
//

import SwiftUI
//import SwiftUIPager

struct FeedView: View {
    @Binding var offset: CGFloat
    @StateObject var feedViewModel = FeedViewModel()
    @ObservedObject var mainSwiperModel: MainViewModel
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
//    func pageView(_ page: Int) -> some View {
//        switch page {
//        case 0: return AnyView(
//            feed
//                .toolbar(.visible, for: .tabBar)
//        )
//        case 1: return AnyView(
//            DiscutionsView(page: $page)
////                .toolbar(.hidden, for: .tabBar)
//        )
//        default: return AnyView(Text("Discussions"))
//        }
//    }
//    var body: some View {
//        var pageBinding = Page.withIndex(page)
//            Pager(page: Page.withIndex(page), data: [0, 1], id: \.self) {
//                self.pageView($0)
//            }
//            .swipeInteractionArea(.allAvailable)
////            .background(navBar())
////        .tabViewStyle(.page(indexDisplayMode: .always))
//    }
//    var body: some View {
    var body: some View {
            NavigationStack {
                ScrollView {
                    LazyVStack(spacing: 32,content: {
                        ForEach(feedViewModel.posts) { post in
                            FeedCell(mainSwiperModel: mainSwiperModel, post: post)
                        }
                    })
                    .padding(.top, 8)
                }
                .refreshable {
                    Task { try await feedViewModel.featchPost() }
                }
                .onAppear(perform: {
                    mainSwiperModel.leftView = nil
                    mainSwiperModel.rightView = .discution
                })
                .navigationTitle("Feed")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Image(.logo)
                            .resizable()
                            .frame(width: 100, height: 32)
                            .padding(.all)
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Image(systemName: "paperplane")
                        .padding(.all)
                        .imageScale(.large)
                        .onTapGesture {
                            withAnimation {
                                mainSwiperModel.activeView = .right
                            }
                        }
                    }
                }
            }
            .onAppear{
                Task { try await feedViewModel.featchPost()
            }
        }
    }
}

#Preview {
    FeedView(offset: .constant(0), mainSwiperModel: MainViewModel())
}
