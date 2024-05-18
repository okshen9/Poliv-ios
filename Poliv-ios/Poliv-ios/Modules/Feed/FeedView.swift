import SwiftUI
import SwiftData

let backgroundGradient = Image("backimage")

struct FeedView: View {
    /// доступ к бд свифта
    @Environment(\.modelContext) var modelContext
    @Query private var myTask: [TestTaskModel]
    
    
    
    var body: some View {
        ZStack{
            Image("backimage")
                .resizable()
                .ignoresSafeArea()
            VStack{
                Text("Тут будет лента со вкладками действия/заметки")
                    .padding()
                List(myTask, rowContent: {
                    
                    Text($0.name)
                })
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
