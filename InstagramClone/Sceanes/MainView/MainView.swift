//
//  MainView.swift
//  InstagramClone
//
//  Created by Zakarai Lachkar on 4/10/2023.
//

import SwiftUI

struct MainView: View {
    let user: User
    @State var selectedIndex = 0
    @State var offset: CGFloat = UIScreen.main.bounds.width * 0
    var body: some View {
        GeometryReader { reader in
            let frame = reader.frame(in: .global)
            if selectedIndex == 0 {
                ScrollableTabBar(tabs: ["",""], rect: frame, offset: $offset) {
                    CenterTabView(user: user, selectedIndex: $selectedIndex, offset: $offset)
                    DiscutionsView(offset: $offset)
                }
            } else {
                CenterTabView(user: user, selectedIndex: $selectedIndex, offset: $offset)
            }
        }
    }
}

#Preview {
    MainView(user: User.MOCK_USERS[0])
}
