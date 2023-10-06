//
//  MainTabView.swift
//  InstagramClone
//
//  Created by Zakarai Lachkar on 25/9/2023.
//

import SwiftUI

struct CenterTabView: View {
    @ObservedObject var mainSwiperModel: MainViewModel
    let user: User
    @State var selectedIndex: Int = 0
    @State var offset: CGFloat = 1
    @State private var isTabViewActive = true
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        TabView(selection: $selectedIndex) {
            FeedView(offset: $offset, mainSwiperModel: mainSwiperModel)
                .onAppear{
                    selectedIndex = 0
                }
                .tabItem {
                    Image(systemName: "house")
                }.tag(0)
            
            SearchView(mainSwiperModel: mainSwiperModel)
                .onAppear{
                    selectedIndex = 1
                }
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }.tag(1)
            
            UploadPostView(mainSwiperModel: mainSwiperModel, tabIndex: $selectedIndex)
                .onAppear{
                    selectedIndex = 2
                }
                .tabItem {
                    Image(systemName: "plus.square")
                }.tag(2)
            
            Text("Notifications")
                .onAppear{
                    mainSwiperModel.leftView = nil
                    mainSwiperModel.rightView = nil
                    selectedIndex = 3
                }
                .tabItem {
                    Image(systemName: "heart")
                }.tag(3)
            
            CurrentUserProfileView(mainSwiperModel: mainSwiperModel, user: user)
                .onAppear{
                    selectedIndex = 4
                }
                .tabItem {
                    Image(systemName: "person")
                }.tag(4)
        }
        .accentColor(colorScheme == .light ? Color.black : Color.white)
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    CenterTabView(mainSwiperModel: MainViewModel(), user: User.MOCK_USERS[0])
}
