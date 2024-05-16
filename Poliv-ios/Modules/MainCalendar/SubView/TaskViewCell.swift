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
                .frame(width: 20, height: 20)
            Text(state.cellType.rawValue + " " + state.nameFlower).padding(.leading, 8)
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
            case watering = "Полить"
            case transfer = "Пересадить"
            case fertilize = "Удобрить"
            case cutting = "Обрезать"
            case meds = "Обработать"
            case grafting = "Привить"
            case propagating = "Черенкование"

            var imageName: String {
                switch self {
                case .watering:
                    return "drop.halffull"
                case .transfer:
                    return "arrowshape.bounce.right"
                case .fertilize:
                    return "eyedropper.halffull"
                case .cutting:
                    return "scissors"
                case .meds:
                    return "cross.case"
                case .grafting:
                    return "laurel.trailing"
                case .propagating:
                    return "leaf"
                }
            }
        }
        
        enum WorkProgress: String {
            /// готово
            case done = "Выполнено"
            /// надо сделать
            case todo = "Надо сделать"
        }
    }
}



#Preview {
    TaskViewCell(state: TaskViewCell.StateCell(nameFlower: "Test",
                                               cellType: .fertilize,
                                               workProgress: .done))
}
