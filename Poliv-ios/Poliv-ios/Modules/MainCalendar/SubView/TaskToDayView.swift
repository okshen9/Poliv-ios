import SwiftUI
import SwiftData

struct TaskToDayView: View {
    
    @Binding var date: Date
    @Query private var myTasks: [TaskModel]
    @Query private var myPlants: [MyPlantModel]
    @State private var myVisbleTasks: [TaskModel]?
    
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
                ForEach(myVisbleTasks ?? []) { task in
                    TaskViewCell(state: TaskViewCell.StateCell(nameFlower:
                                                                task.getPlant(plants: myPlants).namePlant,
                                                               cellType: TaskViewCell.StateCell.CellType.from(index: task.typeNoteDate),
                                                               workProgress: TaskViewCell.StateCell.WorkProgress.from(index: task.stateTask)), 
                                 taskId: task.id)
                    .modelContainer(sharedModelContainer)
                }
            }
        }
        .onAppear {
            myVisbleTasks = myTasks.filter({
                $0.taskDate.getDateString() == date.getDateString()
            })
        }
        .onChange(of: date, {
            myVisbleTasks = myTasks.filter({
                $0.taskDate.getDateString() == date.getDateString()
            })
        })
        .padding(.vertical, 16)
    }
}

extension TaskToDayView {
    enum Constants {
        static let todayText = "В этот день нужно сделать:"
    }
}
