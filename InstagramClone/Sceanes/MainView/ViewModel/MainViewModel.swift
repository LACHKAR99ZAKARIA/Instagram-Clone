//
//  MainViewModel.swift
//  InstagramClone
//
//  Created by Zakarai Lachkar on 4/10/2023.
//

import SwiftUI

@MainActor
class MainViewModel: ObservableObject {
    @Published var leftView: leftViewType?
    @Published var rightView: rightViewType?
    @Published var activeView = currentView.center
    func getLeftView() -> AnyView? {
        switch leftView {
        case .camera:
            AnyView(
                VStack(content: {
                    Text("Camera")
                })
            )
        case nil:
            nil
        }
    }
    func getrightView() -> AnyView? {
        switch rightView {
        case .discution:
            AnyView(DiscutionsView(mainSwiperModel: self))
        case nil:
            nil
        }
    }
}
