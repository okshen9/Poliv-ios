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
                    })
                    Spacer()
                    Text("Создадим новое растение!").frame(maxWidth: .infinity, alignment: .center).padding(.horizontal, 16)

                    TextField("Имя растения",
                              text: $namePlant)
                    .background(.white80)
                    .padding(.horizontal, 16)
                    
                    PickerField(title: getNameTypePlant(),
                                data: typesPlant,
                                selectionIndex: $selectedTypePlant)
                    .frame(maxHeight: 24)
                    .background(.white80)
                    .padding(.horizontal, 16).padding(.vertical, 10)

                    
                    DatePicker("Дата приобретения",
                               selection: $datePlanting,
                               displayedComponents: .date)
                    .background(.white80)
                    .padding(.horizontal, 16)

                    Text("Выберите из списка последнее известное событие:").frame(maxWidth: .infinity, alignment: .leading).padding(.horizontal, 16).padding(.vertical, 10)

                    HStack {
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
                    
                    Text("Вы можете добавить комментарий:").frame(maxWidth: .infinity, alignment: .leading).padding(.horizontal, 16).padding(.vertical, 10)

                    TextField("Напишите комментарий здесь",
                              text: $descriptionPlant, axis: .vertical)
                    .lineLimit(5...10)
                    .background(.white80)
                    .padding(.horizontal, 16)
                    Spacer()
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
        "Последняя пересадка",
        "Последний полив",
        "Последняя обработка",
        "Последняя обрезка",
        "Последнее черенкование",
        "Последнее удобрение",
        "Последнее опрыскивание",
        "Последнее прививание"
    ]
    
    private let typesPlant = [TypePlants.garden.rawValue,
                              TypePlants.home.rawValue]
}

#Preview {
    AddPlantView()
}
