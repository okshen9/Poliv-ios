//
//  TaskModel.swift
//  Poliv-ios
//
//  Created by artem on 18.05.2024.
//

import Foundation
import UIKit
import SwiftData

@Model
final class TaskModel {
    @Attribute(.unique)
    let id: UUID
    
    var stateTask: Int
    var taskDate: Date
    var plantStringId: String
    /// тип события
    var typeNote: Int
    var noteDescription: String?
    
    init(stateTask: Int, taskDate: Date, plantId: String, typeNote: Int, noteDescription: String? = nil) {
        self.id = UUID()
        
        self.stateTask = stateTask
        self.taskDate = taskDate
        self.plantStringId = plantId
        self.typeNote = typeNote
        self.noteDescription = noteDescription
    }
    
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
    case lastSpraying = 6
    /// прививание
    case lastGrafting = 7
}
//}


