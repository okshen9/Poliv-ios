import SwiftUI
import SwiftData

struct ProfilePlantCellView: View {
    @Environment(\.modelContext) var modelContext
    
    init(myPlant: MyPlantModel?) {
        self._myPlant = State(initialValue: myPlant)
        self._namePlant = State(initialValue: myPlant?.namePlant ?? "Error")
    }
    
    @State private var myPlant: MyPlantModel?
    @State private var namePlant: String
    
    var body: some View {
        NavigationLink(destination: AddPlantView(myPlant).modelContainer(sharedModelContainer)) {
            Text(namePlant)
            
        }
    }
}

#Preview {
    ProfilePlantCellView(myPlant: nil)
}
