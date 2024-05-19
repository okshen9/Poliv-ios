import SwiftUI
import SwiftData

struct CreateView: View {
    
    /// доступ к бд свифта
    @Environment(\.modelContext) var modelContext
    @Query var myPalnts: [MyPlantModel]
    @Query var myTask: [TaskModel]
    @Query var myTestTask: [ProfileModel]
    
    
    /// Для возвращения назад в навигации
    @Environment(\.presentationMode) var presentationMode

    @State private var showSheet = false
    
    private var isEdit = false

    
    @State var dateNote = Date.now
    @State var myPlantModelIndex: Int?
    @State var selectedTypeNote: Int?
    @State var notePlant = ""
    
    @State var myPalntsName = [String]()
    
    
    
    var body: some View {
        ZStack {
            Image("backimage")
                .resizable()
                .ignoresSafeArea()
            ScrollView {
                Spacer()
                VStack(spacing: 24) {
                    Text("Создадим новое событие для календаря")
                        .multilineTextAlignment(.center)
                        .font(Font.kudry(20))
                    DatePicker("Дата события",
                               selection: $dateNote,
                               displayedComponents: .date)
                    .background(.white80)
                    .cornerRadius(20)
                    
                    PickerField(title: "Выберите нужное растение",
                                data: myPalnts.map({ $0.namePlant }),
                                selectionIndex: $myPlantModelIndex)
                    .frame(height: 24)
                    .tint(.topGreen)
                    
                    PickerField(title: "Выберите нужное событие",
                                data: typeNoteDate,
                                selectionIndex: $selectedTypeNote)
                    .frame(height: 24)
                    
                    TextField("Вы можете добавить свой комментарий здесь",
                              text: $notePlant,
                              axis: .vertical)
                    .lineLimit(5...7)
                    .background(.white80)
                    .disableAutocorrection(true)
                    Button("Готово", action: {
                        print("Buttonsave")
                        saveTask()
                    })
                    .tint(.white)
                    .padding(16)
                    .background(.topGreen)
                    .cornerRadius(8)
                    Spacer()
                    Spacer()
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 24)
                .fixedSize(horizontal: false, vertical: true)
            }
        }
    }
    
    
    private func saveTask() {
        
//        myPalnts.forEach { 
//            print("neshko\($0.namePlant)")
//        }
        
        guard let myPlantModelIndex else { return }
        
        
        let taskModel = TaskModel(stateTask: getSateTask(dateNote).rawValue,
                                  taskDate: dateNote,
                                  plantId: myPalnts[myPlantModelIndex ?? 0].id.uuidString,
                                  typeNote: getModelTypeNote(selectedTypeNote).rawValue,
                                  noteDescription: notePlant)
        modelContext.insert(taskModel)
        do {
            try modelContext.save()  // Сохраняем изменения в базе данных
            print("Data saved successfully")
        } catch {
            print("Error saving context: \(error)")
        }
        print ("Neshko \(taskModel.stateTask)")
        
    }
    

}

// MARK: - Constants


#Preview {
    CreateView()
}
