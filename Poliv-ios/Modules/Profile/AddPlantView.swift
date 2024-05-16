import SwiftUI

struct AddPlantView: View {
    
    @State private var image = UIImage()
    @State private var showSheet = false

    let saveButton = Button("eee", systemImage: "checkmark") {
        print("About tapped!")
    }

    @State private var namePlant: String = ""
    @State private var notePlant: String = ""
    @State private var descriptionPlant: String = ""
    @State private var selectedTypePlant: Int?
    @State private var selectedTypeNote: Int?
    @State private var datePlanting: Date = Date()
    @State private var dateNote: Date = Date()
    
    var body: some View {
        ZStack {
            Image("backimage")
                .resizable()
                .ignoresSafeArea()
            ScrollView {
                VStack {
                        Image(uiImage: self.image)
                            .resizable()
                            .frame(width: 150,
                                   height: 150)
                            .background(.gray)
                            .padding(.vertical, 20)
                            .onTapGesture {
                        showSheet = true
                    }
                       .sheet(isPresented: $showSheet) {
                    // Pick an image from the photo library:
                    ImagePicker(sourceType: .photoLibrary, selectedImage: self.$image)
            }

                    TextField("Введите имя растения",
                              text: $namePlant)
                    .background(.white80)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 10)

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
                    .cornerRadius(20)

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

                    TextField("Вы можете добавить свой комментарий здесь",
                              text: $descriptionPlant, axis: .vertical)
                    .lineLimit(5...7)
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
        guard let selectedTypePlant  else { return "Выберите тип растения"}
        return typesPlant[selectedTypePlant]
    }
    
    private func getTypeNote() -> String {
        guard let selectedTypePlant  else { return "Событие"}
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
