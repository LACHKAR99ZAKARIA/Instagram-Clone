//
//  SwipeBackModifier.swift
//  InstagramClone
//
//  Created by Zakarai Lachkar on 29/9/2023.
//

import SwiftUI

struct SwipeBackModifier: ViewModifier {
    @Environment(\.presentationMode) var presentationMode
    @GestureState private var dragOffset = CGSize.zero

    func body(content: Content) -> some View {
        content
            .offset(x: self.dragOffset.width)
            .gesture(
                DragGesture()
                    .updating($dragOffset) { value, state, transaction in
                        state = value.translation
                    }
                    .onEnded { value in
                        let dragThreshold: CGFloat = 100
                        if value.translation.width > dragThreshold {
                            self.presentationMode.wrappedValue.dismiss()
                        }
                    }
            )
            .animation(.easeInOut, value: self.dragOffset)
    }
}
