//
//  ProfileView.swift
//  InstagramClone
//
//  Created by Zakarai Lachkar on 25/9/2023.
//

import SwiftUI

struct ProfileView: View {
    @ObservedObject var mainSwiperModel: MainViewModel
    let user: User
    var body: some View {
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
    }
}

#Preview {
    ProfileView(mainSwiperModel: MainViewModel(), user: User.MOCK_USERS[0])
}
