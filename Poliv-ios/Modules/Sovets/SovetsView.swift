//
//  SovetsView.swift
//  Poliv-ios
//
//  Created by artem on 10.05.2024.
//

import SwiftUI

struct SovetsView: View {
    var body: some View { 
        ZStack{
        Image("backimage")
            .resizable()
            .ignoresSafeArea()
        VStack{
            Text("sovets")
                .padding()
        }
    }
    }
}

#Preview {
    SovetsView()
}
