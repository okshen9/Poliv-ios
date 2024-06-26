import SwiftUI
import SwiftData

struct MainCalendarView: View {
    @Query private var myTask: [TaskModel]
    let dataBaseManager = DataBaseManagerSqlLite()
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()


    //MARK: Private Property
    @State private var selectedDate = Date.now
    
    
    //MARK: Body
    var body: some View {
        dataBaseManager.getDataFromBase()
        return ZStack{
            Image("backimage")
                .resizable()
                .ignoresSafeArea()
            VStack {
                Text("Сегодня: \(Date.now, formatter: dateFormatter)") //в заголовке отображается сегодняшняя дата
                    .environment(\.locale, Locale.init(identifier: "ru"))
                    .padding(.all, 20)
                    .frame(maxWidth: .infinity,
                           alignment: .center)
                    .background(Color.topGreen)
                    .foregroundColor(.white)
                    .cornerRadius(20)
                    .font(Font.kudry(20))
                ScrollView {
                    DatePicker("Календарь",
                               selection: $selectedDate,
                               displayedComponents: .date)
                    .environment(\.locale, Locale.init(identifier: "ru"))
                    .datePickerStyle(.graphical)
                    .tint(.topGreen)
                    .background(.white.opacity(0.8))
                    .cornerRadius(20)

                    TaskToDayView().background(.white.opacity(0.8))
                        .cornerRadius(20)
                }
                .scrollIndicators(.hidden)
                Spacer()
            }
            .padding(.top)
            .padding(.horizontal, 20)
        }
        .onAppear {
                    print("neshko myTask \(myTask)")
        }
    }
}
#Preview {
    MainCalendarView()
}
