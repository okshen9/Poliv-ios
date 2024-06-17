import Foundation

extension Date {
    func getDateString() -> String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "d  MMM"
        dateFormater.locale = Locale(identifier: "ru")
        return dateFormater.string(from: self)
    }
}

