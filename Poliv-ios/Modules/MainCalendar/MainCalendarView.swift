//
//  ContentView.swift
//  Poliv-ios
//
//  Created by artem on 10.05.2024.
//

import SwiftUI

struct MainCalendarView: View {
    
    let dataBaseManager = DataBaseManager()
    
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
                    .font(Font.custom("kudry", size: 20))
                ScrollView {
                    DatePicker("Календарь",
                               selection: $selectedDate,
                               displayedComponents: .date)
                    .environment(\.locale, Locale.init(identifier: "ru"))
                    .datePickerStyle(.graphical)
                    .tint(.topGreen)
                    
                    TaskToDayView()
                }
                .scrollIndicators(.hidden)
                Spacer()
            }
            .padding(.top)
            .padding(.horizontal, 20)
        }
    }
}
#Preview {
    MainCalendarView()
}
