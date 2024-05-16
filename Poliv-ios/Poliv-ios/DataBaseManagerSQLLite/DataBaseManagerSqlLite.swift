import Foundation
import GRDB

class DataBaseManagerSqlLite {
    var dataBase: DatabaseQueue?
    
    
    func getDataFromBase() {
        do {
            let databasePath = Bundle.main.path(forResource: "mybase", ofType: "db")!
            dataBase = try DatabaseQueue(path: databasePath)
            getTestTable()
        }
        catch {
            print("ErrorPath")
        }
    }
    
    func getTestTable() {
        do {
            guard let dataBase else { return print("BaseNil")}
            let plants: [Plants] = try dataBase.read { db in
                try Plants.fetchAll(db)
            }
            print(plants)
        }
        catch {
            print("ErrorRead")
        }

    }
}
