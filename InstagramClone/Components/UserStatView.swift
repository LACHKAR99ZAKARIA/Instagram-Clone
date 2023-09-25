//
//  UserStatView.swift
//  InstagramClone
//
//  Created by Zakarai Lachkar on 25/9/2023.
//

import SwiftUI

struct UserStatView: View {
    let value: Int
    let title: String
    var body: some View {
        VStack {
            Text("\(value)")
                .font(.headline)
            Text(title)
                .font(.footnote)
                .fontWeight(.semibold)
        }
        .frame(width: 72)
    }
}

#Preview {
    UserStatView(value: 2, title: "Posts")
}
