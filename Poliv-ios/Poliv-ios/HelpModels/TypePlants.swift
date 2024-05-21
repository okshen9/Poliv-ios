import Foundation

enum TypePlants: String {
    case home = "Комнатное"
    case garden = "Садовое"
}

let typesPlant = [TypePlants.garden.rawValue,
                          TypePlants.home.rawValue]


enum TypeNoteDate: String {
    case lastTransfer = "Пересадка"
    case lastWatering = "Полив"
    case lastTreatment = "Обработка"
    case lastTrimming = "Обрезка"
    case lastCuttings = "Черенкование"
    case lastFertilizer = "Удобрение"
    case lastGrafting = "Прививание"
}



let typeNoteDate = [
    TypeNoteDate.lastTransfer.rawValue,
    TypeNoteDate.lastWatering.rawValue,
    TypeNoteDate.lastTreatment.rawValue,
    TypeNoteDate.lastTrimming.rawValue,
    TypeNoteDate.lastCuttings.rawValue,
    TypeNoteDate.lastFertilizer.rawValue,
    TypeNoteDate.lastGrafting.rawValue
]
