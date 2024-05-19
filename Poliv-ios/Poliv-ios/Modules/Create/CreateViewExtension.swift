//
//  CreateViewExtension.swift
//  Poliv-ios
//
//  Created by artem on 18.05.2024.
//

import Foundation

/// MARK: - Holly Shit
extension CreateView {
    func getSateTask(_ selectedDate: Date?) -> StateTask {
        let isFuture = isFuture(selectedDate)
        return isFuture ? .toDo : .done
    }
    
    func isFuture(_ selectedDate: Date?) -> Bool {
        guard selectedDate != nil else {
            return true
        }

        let now = Date()
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day], from: now, to: dateNote)

        return components.day ?? 0 > 0
    }
    
                                  
    func getModelTypeNote(_ viewTypeNoteIndex: Int?) -> TypeNoteSwiftDate {
            guard let viewTypeNoteIndex else {
                return .lastWatering
            }
        
          guard let viewTypeNote = TypeNoteDate(rawValue: typeNoteDate[viewTypeNoteIndex]) else {
            return .lastWatering
        }
        
        switch viewTypeNote {
        case .lastTransfer: return TypeNoteSwiftDate.lastTransfer
        case .lastWatering: return TypeNoteSwiftDate.lastWatering
        case .lastTreatment: return TypeNoteSwiftDate.lastTreatment
        case .lastTrimming: return TypeNoteSwiftDate.lastTrimming
        case .lastCuttings: return TypeNoteSwiftDate.lastCuttings
        case .lastFertilizer: return TypeNoteSwiftDate.lastFertilizer
        case .lastSpraying: return TypeNoteSwiftDate.lastSpraying
        case .lastGrafting: return TypeNoteSwiftDate.lastGrafting
        }
        return TypeNoteSwiftDate.lastWatering
    }
}
