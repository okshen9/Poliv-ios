import SwiftUI
import SwiftData

let backgroundGradient = Image("backimage")

struct FeedView: View {
    /// доступ к бд свифта
    @Environment(\.modelContext) var modelContext
    @Query private var myTasks: [TaskModel]
    @Query private var myPlants: [MyPlantModel]
    @State private var myVisbleTasks = [TaskModel]()
    
    
    var body: some View {
        ZStack{
            Image("backimage")
                .resizable()
                .ignoresSafeArea()
            VStack(alignment: .leading) {
                Text("Тут будет лента со вкладками действиями/заметки")
                    .padding()
                List(myVisbleTasks) { task in
                    FeedViewCell(plant: task.getPlant(plants: myPlants),
                                 myTask: task)
                }
                .scrollContentBackground(.hidden)
            }
        }
        .onAppear {
            myVisbleTasks = myTasks.filter ({
                $0.stateTask == 1
            })
        }
        .onChange(of: myTasks, {
            myVisbleTasks = myTasks.filter ({
                $0.stateTask == 1
            })
        })
    }
}


#Preview {
    FeedView()
}
