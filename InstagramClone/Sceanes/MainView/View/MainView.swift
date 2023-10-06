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
    @StateObject var viewModel = MainViewModel()
    @State var viewState = CGSize.zero
    var body: some View {
        ZStack {
            CenterTabView(mainSwiperModel: viewModel, user: user)
                .animation(.easeInOut)
            viewModel.getLeftView()
                .offset(x: viewModel.activeView == currentView.left ? 0 : -K.screenWidth)
                .offset(x: viewModel.activeView != .right ? viewState.width : 0)
                .animation(.easeInOut)
            viewModel.getrightView()
                .offset(x: viewModel.activeView == currentView.right ? 0 : K.screenWidth)
                .offset(x: viewModel.activeView != .left ? viewState.width : 0)
                .animation(.easeInOut)
        }
        .gesture(
            
            (viewModel.activeView == currentView.center) ?
                
                DragGesture().onChanged { value in
                    
                    self.viewState = value.translation
                }
                .onEnded { value in
                    if value.predictedEndTranslation.width > K.screenWidth / 2 {
                        viewModel.activeView = currentView.left
                        self.viewState = .zero
                        
                    }
                    else if value.predictedEndTranslation.width < -K.screenWidth / 2 {
                        viewModel.activeView = currentView.right
                        self.viewState = .zero
                    }
                    
                    else {
                        self.viewState = .zero
                    }
                    
                }
                : DragGesture().onChanged { value in
                    switch viewModel.activeView {
                    case .left:
                        guard value.translation.width < 1 else { return }
                        self.viewState = value.translation
                    case .right:
                        guard value.translation.width > 1 else { return }
                        self.viewState = value.translation
                    case.center:
                        self.viewState = value.translation
                        
                    }
                    
                }
                
                .onEnded { value in
                    switch viewModel.activeView {
                    case .left:
                        if value.predictedEndTranslation.width < -K.screenWidth / 2 {
                            viewModel.activeView = .center
                            self.viewState = .zero
                        }
                        else {
                            self.viewState = .zero
                        }
                    case .right:
                        if value.predictedEndTranslation.width > K.screenWidth / 2 {
                            viewModel.activeView = .center
                            self.viewState = .zero
                        }
                        else {
                            self.viewState = .zero
                        }
                    case .center:
                        self.viewState = .zero
                        
                    }
                }
        )
    }
}


#Preview {
    MainView(user: User.MOCK_USERS[0])
}
