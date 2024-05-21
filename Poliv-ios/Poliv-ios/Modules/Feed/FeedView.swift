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
                Text("Лента созданных событий")
                    .padding(.all, 20)
                    .frame(maxWidth: .infinity,
                           alignment: .center)
                    .font(Font.kudry(20))
                    .background(.topGreen)
                    .cornerRadius(20)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 16)
                    .foregroundColor(.white)
                List(myVisbleTasks) { task in
                    FeedViewCell(plant: task.getPlant(plants: myPlants),
                                 myTask: task)
                    .swipeActions {
                    Button("Удалить", action: {
                    modelContext.delete(task)
                                        })
                            }
                }
                .scrollContentBackground(.hidden)
            }
        }
        .onAppear {
            myVisbleTasks = myTasks.sorted(by: {
                return $0.taskDate > $1.taskDate
             })
        }
        .onChange(of: myTasks, {
            myVisbleTasks = myTasks.sorted(by: {
                return $0.taskDate > $1.taskDate
             })
        })
    }
}


#Preview {
    FeedView()
}
