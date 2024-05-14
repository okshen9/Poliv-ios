//
//  ProfileView.swift
//  Poliv-ios
//
//  Created by artem on 10.05.2024.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ZStack{
            Image("backimage")
                .resizable()
                .ignoresSafeArea()
            VStack{
                Text("Тут будет лента со вкладками действия/заметки")
                    .padding()
            }
        }
    }
    }

#Preview {
    ProfileView()
}
