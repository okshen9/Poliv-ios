//
//  AddPlantView.swift
//  Poliv-ios
//
//  Created by artem on 15.05.2024.
//

import SwiftUI

struct AddPlantView: View {
    
    init() {
        _selectedImage = Binding<UIImage>.constant(UIImage(systemName: .tree)!)
    }
    
    let saveButton = Button("eee", systemImage: "checkmark") {
        print("About tapped!")
    }

    @State private var showImagePicker = false
    @State private var namePlant: String = ""
    @State private var notePlant: String = ""
    @State private var descriptionPlant: String = ""
    @State private var selectedTypePlant: Int?
    @State private var selectedTypeNote: Int?
    
    @State private var datePlanting: Date = Date()
    @State private var dateNote: Date = Date()
    @Binding private var selectedImage: UIImage
    
    var body: some View {
        ZStack {
            Image("backimage")
                .resizable()
                .ignoresSafeArea()
            ScrollView {
                VStack(alignment: .center,
                       spacing: 16) {
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
                    })
                    Spacer()
                    
                    TextField("Кличка растения",
                              text: $namePlant)
                    .background(.white80)
                    .padding(.horizontal, 16)
                    
                    PickerField(title: getNameTypePlant(),
                                data: typesPlant,
                                selectionIndex: $selectedTypePlant)
                    .frame(maxHeight: 24)
                    .background(.white80)
                    .padding(.horizontal, 16)
                    
                    
                    DatePicker("Дата посадки",
                               selection: $datePlanting,
                               displayedComponents: .date)
                    .background(.white80)
                    .padding(.horizontal, 16)
                    
                    
                    TextField("Необязательная заметка",
                              text: $notePlant)
                    .background(.white80)
                    .padding(.horizontal, 16)
                    
                    HStack(spacing: 4) {
                        PickerField(title: getTypeNote(),
                                    data: momentDate,
                                    selectionIndex: $selectedTypeNote)
                        .frame(height: 16)
                        
                        DatePicker("",
                                   selection: $dateNote,
                                   displayedComponents: .date)
                    }
                    .background(.white80)
                    .padding(.horizontal, 16)
                    
                    TextField("Добавить описание",
                              text: $descriptionPlant)
                    .background(.white80)
                    .padding(.horizontal, 16)
                    .frame(minHeight: 100)
                    
                    
                }
            }
            .scrollDismissesKeyboard(.interactively)
        }
        .navigationTitle("Добавить растение")
        .toolbar {
            saveButton
        }
    }
    
    // MARK: - Private Func
    
    func bind() {
    }
    
    private func getNameTypePlant() -> String {
        guard let selectedTypePlant  else { return "Тип растения"}
        return typesPlant[selectedTypePlant]
    }
    
    private func getTypeNote() -> String {
        guard let selectedTypePlant  else { return "Дата посадки"}
        return momentDate[selectedTypePlant]
    }
    
    
    // MARK: - Constants
    let momentDate = [
        "Последная пересадк",
        "Последний полив",
        "Последняя обработка",
        "Последняя обрезка",
        "Последнее черенкование",
        "Последнее удобрение",
        "Последнее опрыскивание",
        "Последнее прививание"
    ]
    
    private let typesPlant = [TypePlants.gaden.rawValue,
                              TypePlants.home.rawValue]
}

#Preview {
    AddPlantView()
}
