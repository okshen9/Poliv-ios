//
//  TaskViewCell.swift
//  Poliv-ios
//
//  Created by artem on 10.05.2024.
//

import SwiftUI

struct TaskViewCell: View {
    
    init(state: StateCell) {
        self.state = state
    }
    
    @State private var state: StateCell
    
    var body: some View {
        HStack() {
            Image(systemName: state.cellType.imageName)
                .imageScale(.large)
                .foregroundStyle(.indigo)
            Text(state.cellType.rawValue + " " + state.nameFlower)
            Spacer()
            Text(state.workProgress.rawValue)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(4)
        }
        .padding(.horizontal, 8)
        .background(.white.opacity(0.8))
        .cornerRadius(10)
    }
}


extension TaskViewCell {
    struct StateCell {
        var nameFlower: String
        var cellType: CellType
        var workProgress: WorkProgress
        
        enum CellType: String {
            /// Полив цветочков
            case watering = "Полить"
            /// Пересадка цветочков
            case transfer = "Пересадить"
            /// Удобрение цветочков
            case fertilizer = "Удобрить"
            /// Обрезание цветочков
            case pruning = "Обрезать"
            
            var imageName: String {
                switch self {
                case .watering:
                    return "drop.circle"
                case .transfer:
                    return "signpost.right.and.left"
                case .fertilizer:
                    return "leaf.arrow.triangle.circlepath"
                case .pruning:
                    return "scissors.circle"
                }
            }
        }
        
        enum WorkProgress: String {
            /// готово
            case done = "Выполнено"
            /// в процессе исполнения
            case inProgress = "В процессе"
            /// надо сделать
            case todo = "Надо делать"
        }
    }
}



#Preview {
    TaskViewCell(state: TaskViewCell.StateCell(nameFlower: "Test",
                                               cellType: .watering,
                                               workProgress: .done))
}
