//
//  CurrentUserProfileView.swift
//  InstagramClone
//
//  Created by Zakarai Lachkar on 26/9/2023.
//

import SwiftUI

struct CurrentUserProfileView: View {
    @ObservedObject var mainSwiperModel: MainViewModel
    let user: User
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        NavigationStack {
            ScrollView {
                    ProfileHeaderView(user: user)
                    
                    PostGridView(user: user)
                }
                .onAppear{
                    mainSwiperModel.leftView = nil
                    mainSwiperModel.rightView = nil
                }
                .navigationTitle("Profile")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar(content: {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            AuthService.shared.signOut()
                        } label: {
                            Image(systemName: "line.3.horizontal")
                                .foregroundColor(colorScheme == .light ? Color.black : Color.white)
                        }

                    }
            })
        }
    }
}

#Preview {
    CurrentUserProfileView(mainSwiperModel: MainViewModel(), user: User.MOCK_USERS[0])
}
