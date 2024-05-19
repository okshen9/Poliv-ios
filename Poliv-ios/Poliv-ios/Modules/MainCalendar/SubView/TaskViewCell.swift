import SwiftUI
import SwiftData

struct TaskViewCell: View {
    @Query var myTasks: [TaskModel]
    
    @State private var state: StateCell
    @Environment(\.modelContext) var modelContext
    
    var taskId: UUID
    
    init(state: StateCell, taskId: UUID) {
        self._state = State(initialValue: state)
        self.taskId = taskId
    }
    

    
    var body: some View {
        HStack() {
            Image(systemName: state.cellType.imageName)
                .frame(width: 20, height: 20)
            Text(state.cellType.rawValue + " " + state.nameFlower).padding(.leading, 8)
            Spacer()
            Text(state.workProgress.rawValue)
                .padding(.all, 5)
                .background(Color.gray.opacity(0.8))
                .cornerRadius(5)
                .padding(.all, 5)
                .frame(width: 150)
                .contextMenu {
                    Button("Готово") { 
                        state.workProgress = .done
                        myTasks.first(where: {$0.id == taskId})?.stateTask = 1
                        saveChange()
                    }
                    Button("В процессе", role: .destructive) {
                        state.workProgress = .todo
                        myTasks.first(where: {$0.id == taskId})?.stateTask = 0
                        saveChange()
                    }
                }
        }
        .padding(.horizontal, 8)
    }
    
    @MainActor
    func saveChange() {
        do {
            try modelContext.save()  // Сохраняем изменения в базе данных
            print("Data saved successfully")
        } catch {
            print("Error saving context: \(error)")
        }
    }
    
}


extension TaskViewCell {
    struct StateCell {
        var nameFlower: String
        var cellType: CellType
        var workProgress: WorkProgress
        
        enum CellType: String {
            case watering = "Полить"
            case transfer = "Пересадить"
            case fertilize = "Удобрить"
            case cutting = "Обрезать"
            case meds = "Обработать"
            case grafting = "Привить"
            case propagating = "Черенкование"

            var imageName: String {
                switch self {
                case .watering:
                    return "drop.halffull"
                case .transfer:
                    return "arrowshape.bounce.right"
                case .fertilize:
                    return "eyedropper.halffull"
                case .cutting:
                    return "scissors"
                case .meds:
                    return "cross.case"
                case .grafting:
                    return "laurel.trailing"
                case .propagating:
                    return "leaf"
                }
            }
            
            static func from(index: Int) -> CellType {
                switch index {
                case 0: return .watering
                case 1: return .transfer
                case 2: return .fertilize
                case 3: return .cutting
                case 4: return .meds
                case 5: return .grafting
                case 6: return .propagating
                default: return .watering
                }
            }
        }
        
        enum WorkProgress: String {
            /// готово
            case done = "Выполнено"
            /// надо сделать
            case todo = "Не выполнено"
            
            static func from(index: Int) -> WorkProgress {
                switch index {
                case 0: return .todo
                case 1: return .done
                default: return .todo
                }
            }
        }
    }
}



#Preview {
    TaskViewCell(state: TaskViewCell.StateCell(nameFlower: "Test",
                                               cellType: .fertilize,
                                               workProgress: .done), 
                 taskId: UUID())
}
