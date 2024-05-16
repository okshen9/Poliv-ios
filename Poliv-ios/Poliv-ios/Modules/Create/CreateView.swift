import SwiftUI
import SwiftData

struct CreateView: View {

    @Query private var myPalnts: [MyPlantModel]
    @Environment(\.modelContext) var modelContext

    var body: some View {
        ZStack{
        Image("backimage")
            .resizable()
            .ignoresSafeArea()
        VStack{
            Text("tut create")
                .padding()
        }
    }
    }
}

#Preview {
    CreateView()
}
