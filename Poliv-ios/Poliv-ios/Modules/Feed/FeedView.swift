import SwiftUI
import SwiftData

let backgroundGradient = Image("backimage")

struct FeedView: View {
    /// доступ к бд свифта
    @Environment(\.modelContext) var modelContext
    @Query private var myTask: [TaskModel]
    @Query private var myPlants: [MyPlantModel]
    
    
    
    var body: some View {
        ZStack{
            Image("backimage")
                .resizable()
                .ignoresSafeArea()
            VStack(alignment: .leading) {
                Text("Тут будет лента со вкладками действия/заметки")
                    .padding()
                List(myTask) { task in
                    FeedViewCell(plant: task.getPlant(plants: myPlants),
                                 myTask: task)
                }
                .scrollContentBackground(.hidden)
            }
        }
        .onAppear {
            print("NNNCount \(myTask.count)")
        }
    }
}


#Preview {
    FeedView()
}
