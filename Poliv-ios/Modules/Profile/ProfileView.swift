//
//  ProfileView.swift
//  Poliv-ios
//
//  Created by artem on 10.05.2024.
//

import SwiftUI

struct ProfileView: View {
    
    init() {
        _selectedImage = Binding<UIImage>.constant(UIImage(systemName: .tree)!)
    }

    @State private var showImagePicker = false
    @Binding private var selectedImage: UIImage

    var body: some View {
        NavigationView {
            ZStack{
                Image("backimage")
                    .resizable()
                    .ignoresSafeArea()
                VStack {
                    Button(action: {
                        self.showImagePicker.toggle()
                    }) {
                        Image(uiImage: $selectedImage.wrappedValue)
                            .resizable()
                            .foregroundStyle(.topGreen)
                            .padding(10)
                            .frame(width: 100,
                                   height: 100)
                            .background(.white80)
                            .cornerRadius(50)
                    }.sheet(isPresented: $showImagePicker,
                            content: { ImagePicker(image: $selectedImage)
                    })//картинка для профиля

                    NavigationLink(destination: AddPlantView()) {
                        Text("Тут будет лента со вкладками действия/заметки").padding(10)
                    }
                }
            }
        }.navigationTitle("Профиль")
    }
}

#Preview {
    ProfileView()
}
