import SwiftUI
import SwiftData

struct CreateView: View {
    
    /// доступ к бд свифта
    @Environment(\.modelContext) var modelContext
    @Query private var myPalnts: [TestTaskModel]
    
    
    /// Для возвращения назад в навигации
    @Environment(\.presentationMode) var presentationMode

    @State private var showSheet = false
    
    private var isEdit = false

    
    @State private var dateNote = Date.now
    @State private var myPlantModelIndex: Int?
    @State private var selectedTypeNote: Int?
    @State private var notePlant = ""
    
    
    
    var body: some View {
        ZStack {
            Image("backimage")
                .resizable()
                .ignoresSafeArea()
            ScrollView {
                Spacer()
                VStack(spacing: 24) {
                    DatePicker("Дата события",
                               selection: $dateNote,
                               displayedComponents: .date)
                    .background(.white80)
                    .cornerRadius(20)
                    
                    PickerField(title: "Выберите нужное растение",
                                data: /*myPalnts.map { $0.namePlant }*/
                                ["test1",
                                 "test2"
                                ]
                                ,
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
//        guard let myPlantModelIndex else { return }
        
        print("NeshkosaveTask \(getSateTask(dateNote).rawValue)")
        print("NeshkosaveTask \(dateNote)")
        print("NeshkosaveTask \(getModelTypeNote(selectedTypeNote).rawValue)")
        print("NeshkosaveTask \(notePlant)")
        
        
        let taskModel = TaskModel(stateTask: getSateTask(dateNote).rawValue,
                                  taskDate: dateNote,
                                  plantId: "Test",//myPalnts[myPlantModelIndex].id.uuidString,
                                  typeNote: getModelTypeNote(selectedTypeNote).rawValue,
                                  noteDescription: notePlant)
        print("Neshko{{{ \(taskModel)")
        
        modelContext.insert(TestTaskModel(name: "Teeeest"))
//        print("SEVEERROR = \(try? modelContext.save())")
    }
    


    
    
    // MARK: - Constants
    let typeNoteDate = [
        TypeNoteDate.lastTransfer.rawValue,
        TypeNoteDate.lastWatering.rawValue,
        TypeNoteDate.lastTreatment.rawValue,
        TypeNoteDate.lastTrimming.rawValue,
        TypeNoteDate.lastCuttings.rawValue,
        TypeNoteDate.lastFertilizer.rawValue,
        TypeNoteDate.lastSpraying.rawValue,
        TypeNoteDate.lastGrafting.rawValue
    ]
}

/// MARK: - Holly Shit
extension CreateView {
    private func getSateTask(_ selectedDate: Date?) -> StateTask {
        let isFuture = isFuture(selectedDate)
        return isFuture ? .toDo : .done
    }
    
    private func isFuture(_ selectedDate: Date?) -> Bool {
        guard selectedDate != nil else {
            return true
        }

        let now = Date()
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day], from: now, to: dateNote)

        return components.day ?? 0 > 0
    }
    
                                  
    private func getModelTypeNote(_ viewTypeNoteIndex: Int?) -> TypeNoteSwiftDate {
            guard let viewTypeNoteIndex else {
                return .lastWatering
            }
        
          guard let viewTypeNote = TypeNoteDate(rawValue: typeNoteDate[viewTypeNoteIndex]) else {
            return .lastWatering
        }
        
        switch viewTypeNote {
        case .lastTransfer: return TypeNoteSwiftDate.lastTransfer
        case .lastWatering: return TypeNoteSwiftDate.lastWatering
        case .lastTreatment: return TypeNoteSwiftDate.lastTreatment
        case .lastTrimming: return TypeNoteSwiftDate.lastTrimming
        case .lastCuttings: return TypeNoteSwiftDate.lastCuttings
        case .lastFertilizer: return TypeNoteSwiftDate.lastFertilizer
        case .lastSpraying: return TypeNoteSwiftDate.lastSpraying
        case .lastGrafting: return TypeNoteSwiftDate.lastGrafting
        }
        return TypeNoteSwiftDate.lastWatering
    }
}

#Preview {
    CreateView()
}
