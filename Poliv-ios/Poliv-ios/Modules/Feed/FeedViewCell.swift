import SwiftUI

struct FeedViewCell: View {
    var plant: MyPlantModel
    var myTask: TaskModel
    
    init(plant: MyPlantModel, myTask: TaskModel) {
        self.plant = plant
        self.myTask = myTask
    }
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("\(myTask.taskDate.getDateString())")
            Text(plant.namePlant)
           // Text(TypeNoteDate(rawValue: plant.selectedTypePlant ?? "")?.rawValue ?? TypeNoteDate.lastWatering.rawValue)
            Text(CellType.from(index: myTask.typeNoteDate).feedName ?? CellType.watering.feedName)
        }
        .cornerRadius(8)
        .padding(16)
        
    }

}

#Preview {
    FeedViewCell(plant: MyPlantModel.MockModel, myTask: TaskModel.MockModel)
}
