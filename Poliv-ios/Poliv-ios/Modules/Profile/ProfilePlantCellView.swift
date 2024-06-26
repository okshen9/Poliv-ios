//
//  ProfilePlantCellView.swift
//  Poliv-ios
//
//  Created by artem on 16.05.2024.
//

import SwiftUI
import SwiftData

struct ProfilePlantCellView: View {
    @Environment(\.modelContext) var modelContext
    
    init(myPlant: MyPlantModel?) {
        self._myPlant = State(initialValue: myPlant)
        self._namePlant = State(initialValue: myPlant?.namePlant ?? "Error")
    }
    
    @State private var myPlant: MyPlantModel?
    @State private var namePlant: String
    
    var body: some View {
        NavigationLink(destination: AddPlantView(myPlant).modelContainer(for: MyPlantModel.self)) {
            Text(namePlant)
            
        }
    }
}

#Preview {
    ProfilePlantCellView(myPlant: nil)
}
