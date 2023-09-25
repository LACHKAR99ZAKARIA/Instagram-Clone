//
//  ProfileView.swift
//  InstagramClone
//
//  Created by Zakarai Lachkar on 25/9/2023.
//

import SwiftUI

struct ProfileView: View {
    private let grideItems: [GridItem] = [
        .init(.flexible(),  spacing: 1),
        .init(.flexible(),  spacing: 1),
        .init(.flexible(),  spacing: 1),
    ]
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 10) {
                    HStack {
                        Image(.zakarialachkarProfile)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                        Spacer()
                        HStack(spacing: 8, content: {
                            UserStatView(value: 3, title: "Posts")
                            UserStatView(value: 38, title: "Followers")
                            UserStatView(value: 42, title: "Following")
                        })
                    }
                    .padding(.horizontal)
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Zakaria Lachkar")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        Text("zakaria99la")
                            .font(.footnote)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    Button {
                        
                    } label: {
                        Text("Edit Profile")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: 360, height: 32)
                            .foregroundStyle(.black)
                            .overlay {
                                RoundedRectangle(cornerRadius: 6)
                                    .stroke(.gray, lineWidth: 1)
                            }
                    }

                    Divider()
                }
                
                LazyVGrid(columns: grideItems, spacing: 1, content: {
                    ForEach(0 ... 15, id: \.self) { index in
                        Image(.uiKit)
                            .resizable()
                            .scaledToFit()
                    }
                })
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundColor(.black)
                    }

                }
            })
        }
    }
}

#Preview {
    ProfileView()
}
