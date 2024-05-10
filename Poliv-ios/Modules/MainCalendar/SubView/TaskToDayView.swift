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
                
                List {
                    TaskViewCell(state: TaskViewCell.StateCell(nameFlower: "Алое",
                                                               cellType: .watering,
                                                               workProgress: .done))
                    .listRowBackground(Color.white)
                    TaskViewCell(state: TaskViewCell.StateCell(nameFlower: "Алое",
                                                               cellType: .transfer,
                                                               workProgress:.inProgress))
                    .listRowBackground(Color.white)
                    TaskViewCell(state: TaskViewCell.StateCell(nameFlower: "Алое",
                                                               cellType: .fertilizer,
                                                               workProgress: .done))
                    .listRowBackground(Color.white)
                    TaskViewCell(state: TaskViewCell.StateCell(nameFlower: "Алое",
                                                               cellType: .pruning,
                                                               workProgress: .todo))
                    .listRowBackground(Color.white)
                }
                
                .listRowSpacing(8)
                .padding(.horizontal, -20)
                .listStyle(.inset)
                .scrollContentBackground(.hidden)
            }
            .padding(.vertical, 16)
            .background(.gray)
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
