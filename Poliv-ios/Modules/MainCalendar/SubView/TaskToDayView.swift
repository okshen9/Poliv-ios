//
//  TaskToDayView.swift
//  Poliv-ios
//
//  Created by artem on 10.05.2024.
//

import SwiftUI

struct TaskToDayView: View {
    var body: some View {
            VStack(alignment: .leading, spacing: 6) {
                Text(Constants.todayText)
                    .font(.title2)
                    .padding(.horizontal, 8)
                    .frame(
                           maxWidth: .infinity,
                           alignment: .leading)
                Divider()
                
                VStack(spacing: 6) {
                    TaskViewCell(state: TaskViewCell.StateCell(nameFlower: "Алое",
                                                               cellType: .watering,
                                                               workProgress: .done))
              
                    TaskViewCell(state: TaskViewCell.StateCell(nameFlower: "Алое",
                                                               cellType: .transfer,
                                                               workProgress:.inProgress))

                    TaskViewCell(state: TaskViewCell.StateCell(nameFlower: "Алое",
                                                               cellType: .fertilizer,
                                                               workProgress: .done))

                    TaskViewCell(state: TaskViewCell.StateCell(nameFlower: "Алое",
                                                               cellType: .pruning,
                                                               workProgress: .todo))
                }            }
            .padding(.vertical, 16)
            .cornerRadius(20)
    }
}

#Preview {
    TaskToDayView()
}

extension TaskToDayView {
    enum Constants {
        static let todayText = "Нужно сделать:"
    }
}
