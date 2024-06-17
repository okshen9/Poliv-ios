import Foundation
import UIKit
import SwiftData

@Model
final class MyPlantModel: ObservableObject, Identifiable {
    @Attribute(.unique) let id: UUID
    
    var namePlant: String
    var notePlant: String
    var descriptionPlant: String
    var selectedTypePlant: String?
    var selectedTypeNote: String?
    var datePlanting: Date
    var dateNote: Date
    var imagePlantData: Data
    
    init(id: UUID = UUID(),
         namePlant: String,
         notePlant: String,
         descriptionPlant: String,
         selectedTypePlant: String,
         selectedTypeNote: String,
         datePlanting: Date,
         dateNote: Date,
         imagePlant: UIImage?
    ) {
        self.id = id
        
        self.namePlant = namePlant
        self.notePlant = notePlant
        self.descriptionPlant = descriptionPlant
        self.selectedTypePlant = selectedTypePlant
        self.selectedTypeNote = selectedTypeNote
        self.datePlanting = datePlanting
        self.dateNote = dateNote
        self.imagePlantData = imagePlant?.pngData() ?? Data()
    }
    
    func update(namePlant: String,
         notePlant: String,
         descriptionPlant: String,
         selectedTypePlant: String,
         selectedTypeNote: String,
         datePlanting: Date,
         dateNote: Date,
         imagePlant: UIImage?
    ) {
        print("Updating plant with name: \(namePlant)")
        self.namePlant = namePlant
        self.notePlant = notePlant
        self.descriptionPlant = descriptionPlant
        self.selectedTypePlant = selectedTypePlant
        self.selectedTypeNote = selectedTypeNote
        self.datePlanting = datePlanting
        self.dateNote = dateNote
        self.imagePlantData = imagePlant?.pngData() ?? Data()
    }
    
}

extension MyPlantModel {
    var imagePlant: UIImage? {
        get {
            return UIImage(data: imagePlantData) ?? UIImage(systemName: "tree")!
        }
        set {
            imagePlantData = newValue?.pngData() ?? Data()
        }
    }
    
    func setNewData(editedPlant: MyPlantModel) {
        self.namePlant = editedPlant.namePlant
        self.notePlant = editedPlant.notePlant
        self.descriptionPlant = editedPlant.descriptionPlant
        self.selectedTypePlant = editedPlant.selectedTypePlant
        self.selectedTypeNote = editedPlant.selectedTypeNote
        self.datePlanting = editedPlant.datePlanting
        self.dateNote = editedPlant.dateNote
        
        self.imagePlantData = editedPlant.imagePlantData
    }
    
    static let MockModel = MyPlantModel(namePlant: "Test", notePlant: "Test", descriptionPlant: "Test", selectedTypePlant: TypePlants.garden.rawValue, selectedTypeNote: TypeNoteDate.lastTransfer.rawValue, datePlanting: Date(), dateNote: Date(), imagePlant: nil)
}
