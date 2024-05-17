import SwiftUI

struct TaskToDayView: View {
    var body: some View {
            VStack(alignment: .leading, spacing: 6) {
                Text(Constants.todayText)
                    .font(Font.custom("kudry", size: 20))
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
                                                               workProgress:.done))

                    TaskViewCell(state: TaskViewCell.StateCell(nameFlower: "Алое",
                                                               cellType: .fertilize,
                                                               workProgress: .done))

                    TaskViewCell(state: TaskViewCell.StateCell(nameFlower: "Каланхое",
                                                               cellType: .cutting,
                                                               workProgress: .todo))
                }            }
            .padding(.vertical, 16)
    }
}

#Preview {
    TaskToDayView()
}

extension TaskToDayView {
    enum Constants {
        static let todayText = "Сегодня нужно сделать:"
    }
}
