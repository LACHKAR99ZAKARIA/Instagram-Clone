//
//  DiscutionsView.swift
//  InstagramClone
//
//  Created by Zakarai Lachkar on 1/10/2023.
//

import SwiftUI

struct DiscutionsView: View {
    @State private var searchText = ""
    @ObservedObject var mainSwiperModel: MainViewModel
    var body: some View {
            NavigationStack {
                ScrollView {
                    LazyVStack(content: {
                        ForEach(1...10, id: \.self) { count in
                            HStack {
                                
                            }
                        }
                    })
                    .refreshable {
                        
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        HStack {
                            Image(systemName: "chevron.left")
                                .onTapGesture {
                                    withAnimation {
                                        mainSwiperModel.activeView = .center
                                    }
                                }
                            HStack{
                                Text("zakaria.lachkar")
                                    .font(.title2)
                                Image(systemName: "chevron.down")
                                    .font(.system(size: 15))
                            }
                            .fontWeight(.semibold)
                        }
                        .padding(.all)
                    }
                }
            }
//            .toolbar(.hidden, for: .tabBar)
    }
}

#Preview {
    DiscutionsView(mainSwiperModel: MainViewModel())
}
