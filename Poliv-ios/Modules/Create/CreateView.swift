//
//  CreateView.swift
//  Poliv-ios
//
//  Created by artem on 10.05.2024.
//

import SwiftUI

struct CreateView: View {
    var body: some View {
        ZStack{
            Image("backimage")
                .resizable()
                .ignoresSafeArea()
            VStack{
                Text("tut create")
                    .padding()
            }
        }
    }
}

#Preview {
    CreateView()
}
