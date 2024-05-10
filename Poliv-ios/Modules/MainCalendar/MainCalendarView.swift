//
//  ContentView.swift
//  Poliv-ios
//
//  Created by artem on 10.05.2024.
//

import SwiftUI

struct MainCalendarView: View {
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()
    
    //MARK: Private Property
    @State private var selectedDate = Date.now
    
    
    //MARK: Body
    var body: some View {
        VStack {
            Text("\(selectedDate, formatter: dateFormatter)")
                .padding(.all, 20)
                .frame(maxWidth: .infinity,
                       alignment: .center)
                .background(.gray)
                .cornerRadius(20)
            DatePicker("Календарь",
                       selection: $selectedDate,
                       displayedComponents: .date)
            .datePickerStyle(.graphical)
            .tint(.topGreen)
//            lkjhkjlh
            TaskToDayView()
        }
        .padding(.top)
        .padding(.horizontal, 20)
        .background(LinearGradient(gradient: Gradient(colors: [Color.topGreen,
                                                                   Color.middleGreen,
                                                                   Color.botomGreen]),
                                   startPoint: .top,
                                   endPoint: .bottom))
        
    }
    
    
    
}

#Preview {
    MainCalendarView()
}
