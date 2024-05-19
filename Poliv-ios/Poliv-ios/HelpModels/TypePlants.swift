import Foundation

enum TypePlants: String {
    case home = "Комнатное"
    case garden = "Садовое"
}

let typesPlant = [TypePlants.garden.rawValue,
                          TypePlants.home.rawValue]


enum TypeNoteDate: String {
    case lastTransfer = "Последняя пересадка"
    case lastWatering = "Последний полив"
    case lastTreatment = "Последняя обработка"
    case lastTrimming = "Последняя обрезка"
    case lastCuttings = "Последнее черенкование"
    case lastFertilizer = "Последнее удобрение"
    case lastSpraying = "Последнее опрыскивание"
    case lastGrafting = "Последнее прививание"
}



let typeNoteDate = [
    TypeNoteDate.lastTransfer.rawValue,
    TypeNoteDate.lastWatering.rawValue,
    TypeNoteDate.lastTreatment.rawValue,
    TypeNoteDate.lastTrimming.rawValue,
    TypeNoteDate.lastCuttings.rawValue,
    TypeNoteDate.lastFertilizer.rawValue,
    TypeNoteDate.lastSpraying.rawValue,
    TypeNoteDate.lastGrafting.rawValue
]
