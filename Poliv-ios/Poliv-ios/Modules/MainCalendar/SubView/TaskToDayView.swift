import SwiftUI
import SwiftData

struct TaskToDayView: View {
    
    @Binding var date: Date
    @Query private var myTasks: [TaskModel]
    @Query private var myPlants: [MyPlantModel]
    
//    init(myTasks: [TaskModel], myPlants: [MyPlantModel], date: Date) {
////        let newtasks = myTasks.filter {
////            print(date.getDateString() + " tets0")
////            print($0.taskDate.getDateString() + " tets1")
////            return $0.taskDate.getDateString() == date.getDateString()
////        }
//        self.date = date
////        self._myTasks = State(wrappedValue: newtasks)
////        print("\(newtasks.count) tets2")
////        self._myPlants = State(initialValue: myPlants)
//    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(Constants.todayText)
                .font(Font.kudry(20))
                .padding(.horizontal, 8)
                .frame(
                    maxWidth: .infinity,
                    alignment: .leading)
            
            Divider()
            
            VStack(spacing: 6) {
                ForEach(myTasks.filter({
                    $0.taskDate.getDateString() == date.getDateString()
                })) { task in
                    TaskViewCell(state: TaskViewCell.StateCell(nameFlower:
                                                                task.getPlant(plants: myPlants).namePlant,
                                                               cellType: TaskViewCell.StateCell.CellType.from(index: task.typeNoteDate),
                                                               workProgress: TaskViewCell.StateCell.WorkProgress.from(index: task.stateTask)), 
                                 taskId: task.id)
                    .modelContainer(sharedModelContainer)
                }
//                .listStyle(.plain)
//                .scrollDisabled(true)
            }
        }
        .padding(.vertical, 16)
    }
}

//#Preview {
//    TaskToDayView(myTask: <#Binding<[TaskModel]>#>, myPlants: <#Binding<[MyPlantModel]>#>)
//}

extension TaskToDayView {
    enum Constants {
        static let todayText = "Сегодня нужно сделать:"
    }
}
