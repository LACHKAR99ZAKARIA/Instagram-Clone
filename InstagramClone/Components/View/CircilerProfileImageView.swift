//
//  CircilerProfileImageView.swift
//  InstagramClone
//
//  Created by Zakarai Lachkar on 28/9/2023.
//

import SwiftUI
import Kingfisher

enum ProfileImageView {
    case xSmale
    case smale
    case medium
    case large
    
    var dimention: CGFloat {
        switch self {
        case .xSmale:
            40
        case .smale:
            48
        case .medium:
            64
        case .large:
            80
        }
    }
}
struct CircilerProfileImageView: View {
    let user: User
    let size: ProfileImageView
    var body: some View {
        if let imgUrl = user.profileImageUrl {
            KFImage(URL(string: imgUrl))
                .resizable()
                .scaledToFill()
                .frame(width: size.dimention, height: size.dimention)
                .clipShape(Circle())
        } else {
            Image(systemName: "person.circle.fill")
                .resizable()
                .scaledToFill()
                .frame(width: size.dimention, height: size.dimention)
                .foregroundColor(Color(.systemGray4))
                .clipShape(Circle())
        }
    }
}

#Preview {
    CircilerProfileImageView(user: User.MOCK_USERS[0], size: .large)
}
