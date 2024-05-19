//
//  DateFormater.swift
//  Poliv-ios
//
//  Created by artem on 20.05.2024.
//

import Foundation

extension Date {
    func getDateString() -> String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "d  MMM"
        dateFormater.locale = Locale(identifier: "ru")
        return dateFormater.string(from: self)
    }
}

