import Foundation
import UIKit
import SwiftData

@Model
final class TaskModel: ObservableObject, Identifiable {
    @Attribute(.unique)
    let id: UUID
    
    var stateTask: Int
    var taskDate: Date
    var plantStringId: String
    /// тип события
    var typeNoteDate: Int
    var noteDescription: String?
    
    init(stateTask: Int, taskDate: Date, plantId: String, typeNote: Int, noteDescription: String? = nil) {
        self.id = UUID()
        
        self.stateTask = stateTask
        self.taskDate = taskDate
        self.plantStringId = plantId
        self.typeNoteDate = typeNote
        self.noteDescription = noteDescription
    }
    func getPlant(plants: [MyPlantModel]) -> MyPlantModel {
        let testPlant = plants.filter { $0.id.uuidString == self.plantStringId }.first
        
        return testPlant ??
        MyPlantModel(namePlant: "нет данных",
                     notePlant: "нет данных",
                     descriptionPlant: "нет данных",
                     selectedTypePlant: "нет данных",
                     selectedTypeNote: "нет данных",
                     datePlanting: Date(),
                     dateNote: Date(),
                     imagePlant: nil)
    }
    
    static let MockModel = TaskModel(stateTask: 0, taskDate: Date(), plantId: "Test", typeNote: 0)
}


    /// Если дата исполнения в будущем - 0 - надо делать
    /// Если дата исполнения в прошлом - 1 - исполнено
enum StateTask: Int {
    case done = 1
    case toDo = 0
}
    
enum TypeNoteSwiftDate: Int {
    /// пересадка
    case lastTransfer = 0
    /// полив
    case lastWatering = 1
    /// обработка
    case lastTreatment = 2
    /// обрезка
    case lastTrimming = 3
    /// черенкование
    case lastCuttings = 4
    /// удобрение
    case lastFertilizer = 5
    /// опрыскивание
    /// прививание
    case lastGrafting = 6
}
//}


