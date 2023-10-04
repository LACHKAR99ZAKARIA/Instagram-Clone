//
//  MainTabView.swift
//  InstagramClone
//
//  Created by Zakarai Lachkar on 25/9/2023.
//

import SwiftUI

struct CenterTabView: View {
    let user: User
    @Binding var selectedIndex: Int
    @Binding var offset: CGFloat
    @State private var isTabViewActive = true
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        TabView(selection: $selectedIndex) {
            FeedView(offset: $offset)
                .onAppear{
                    selectedIndex = 0
                }
                .tabItem {
                    Image(systemName: "house")
                }.tag(0)
            
            SearchView()
                .onAppear{
                    selectedIndex = 1
                }
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }.tag(1)
            
            UploadPostView(tabIndex: $selectedIndex)
                .onAppear{
                    selectedIndex = 2
                }
                .tabItem {
                    Image(systemName: "plus.square")
                }.tag(2)
            
            Text("Notifications")
                .onAppear{
                    selectedIndex = 3
                }
                .tabItem {
                    Image(systemName: "heart")
                }.tag(3)
            
            CurrentUserProfileView(user: user)
                .onAppear{
                    selectedIndex = 4
                }
                .tabItem {
                    Image(systemName: "person")
                }.tag(4)
        }
        .accentColor(colorScheme == .light ? Color.black : Color.white)
    }
}

#Preview {
    CenterTabView(user: User.MOCK_USERS[0], selectedIndex: .constant(0), offset: .constant(0))
}
