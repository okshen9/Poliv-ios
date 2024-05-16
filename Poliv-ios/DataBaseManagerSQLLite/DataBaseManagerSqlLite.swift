//
//  DataBaseManager.swift
//  Poliv-ios
//
//  Created by artem on 14.05.2024.
//

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
            print("NeshkoErrorPath")
        }
    }
    
    func getTestTable() {
        do {
            guard let dataBase else { return print("NeshkoBaseNil")}
            let players: [Plants] = try dataBase.read { db in
                try Plants.fetchAll(db)
            }
            print(players)
        }
        catch {
            print("NeshkoErrorRead")
        }

    }
}
