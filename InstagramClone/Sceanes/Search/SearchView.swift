//
//  SearchView.swift
//  InstagramClone
//
//  Created by Zakarai Lachkar on 25/9/2023.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 12,content: {
                    ForEach(1...15, id: \.self) { user in
                        HStack {
                            Image(.zakarialachkarProfile)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                                .clipShape(Circle())
                            VStack {
                                Text("zakaria99la")
                                    .fontWeight(.semibold)
                                Text("Zakaria La")
                            }
                            .font(.footnote)
                            Spacer()
                        }
                        .padding(.horizontal)
                    }
                })
                .padding(.top, 8)
                .searchable(text: $searchText, prompt: "Search...")
            }
        }
        .navigationTitle("Explore")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    SearchView()
}
