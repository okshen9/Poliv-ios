import SwiftUI
import SwiftData

struct AddPlantView: View {
    
    /// доступ к бд свифта
    @Environment(\.modelContext) var modelContext
    
    /// Для возвращения назад в навигации
    @Environment(\.presentationMode) var presentationMode

    @State private var showSheet = false

    @State private var namePlant: String
    @State private var notePlant: String
    @State private var descriptionPlant: String
    @State private var selectedTypePlant: Int?
    @State private var selectedTypeNote: Int?
    @State private var datePlanting: Date
    @State private var dateNote: Date
    @State private var imagePlant: UIImage
    
    private var isEdit = false
    private var myCurrentPlant: MyPlantModel?
    
    init(_ myPlant: MyPlantModel?) {
        if myPlant != nil {
            self.isEdit = true
            self.myCurrentPlant = myPlant
        }
        if let imageData = myPlant?.imagePlantData {
            self._imagePlant = State(initialValue: UIImage(data: imageData) ?? UIImage(systemName: .tree)!)
        } else
        {
            self._imagePlant = State(initialValue: UIImage(systemName: .tree)!)
        }
        
        self._namePlant = State(initialValue: myPlant?.namePlant ?? "")
        self._notePlant = State(initialValue: myPlant?.notePlant ?? "")
        self._descriptionPlant = State(initialValue: myPlant?.descriptionPlant ?? "")
        self._selectedTypePlant = State(initialValue: typesPlant.firstIndex(of: myPlant?.selectedTypePlant ?? "") ?? 0)
        self._selectedTypeNote = State(initialValue: typeNoteDate.firstIndex(of: myPlant?.selectedTypeNote ?? "") ?? 0)
        self._datePlanting = State(initialValue: myPlant?.datePlanting ?? Date())
        self._dateNote = State(initialValue: myPlant?.dateNote ?? Date())
        
    }
    
    var body: some View {
        ZStack {
            Image("backimage")
                .resizable()
                .ignoresSafeArea()
            ScrollView {
                VStack {
                    HStack {
                        Image(uiImage: self.imagePlant)
                                .resizable()
                                .frame(width: 150,
                                       height: 150)
                                .background(.white80)
                                .cornerRadius(20)
                                .padding(.vertical, 20)
                                .padding(.horizontal, 16)
                                .onTapGesture {
                            showSheet = true
                        }
                           .sheet(isPresented: $showSheet) {
                        // Pick an image from the photo library:
                        ImagePicker(sourceType: .photoLibrary, selectedImage: self.$imagePlant)
                       }
                        Text("Выберите из Вашей галереи фотографию растения")
                            .padding(.horizontal)
                            .multilineTextAlignment(.center)
                            .font(Font.custom("kudry", size: 20))

                    }   .background(.topGreen)
                        .foregroundColor(.white)
                        .cornerRadius(20)

                    TextField("Введите имя растения",
                              text: $namePlant)
                    .background(.white80)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 10)
                    .disableAutocorrection(true)

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
                                    data: typeNoteDate,
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
                    .disableAutocorrection(true)
                    Spacer()
                }
            }
            .scrollDismissesKeyboard(.interactively)
        }
        .navigationTitle("Редактирование растения")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("",
                       systemImage: "checkmark",
                       action: savePlant)
            }
        }
    }
    
    // MARK: - Private Func
    
    private func savePlant() {
        let myPlants = MyPlantModel(namePlant: namePlant,
                                    notePlant: notePlant,
                                    descriptionPlant: descriptionPlant,
                                    selectedTypePlant: typesPlant[selectedTypePlant ?? 0],
                                    selectedTypeNote: typeNoteDate[selectedTypeNote ?? 0],
                                    datePlanting: datePlanting,
                                    dateNote: dateNote,
                                    imagePlant: imagePlant)
        if isEdit,
           let myCurrentPlant,
           let oldModel = modelContext.model(for: myCurrentPlant.id) as? MyPlantModel {
            modelContext.delete(oldModel)
        }
        modelContext.insert(myPlants)
        self.presentationMode.wrappedValue.dismiss()
    }
    
    private func getNameTypePlant() -> String {
        guard let selectedTypePlant  else { return "Выберите тип растения"}
        return typesPlant[selectedTypePlant]
    }
    
    private func getTypeNote() -> String {
        guard let selectedTypePlant  else { return "Событие"}
        return typeNoteDate[selectedTypePlant]
    }
    
    
    // MARK: - Constants
    let typeNoteDate = [
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
    AddPlantView(nil)
}