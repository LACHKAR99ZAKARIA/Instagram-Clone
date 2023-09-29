//
//  InstagramTextFieldModifier.swift
//  InstagramClone
//
//  Created by Zakarai Lachkar on 25/9/2023.
//

import SwiftUI

struct InstagramTextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(12)
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal, 24)
    }
}
