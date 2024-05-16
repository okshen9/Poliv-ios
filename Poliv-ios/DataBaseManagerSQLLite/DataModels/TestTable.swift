//
//  TestTable.swift
//  Poliv-ios
//
//  Created by artem on 14.05.2024.
//

import Foundation
import GRDB

struct TestTable: Identifiable, Codable, FetchableRecord, PersistableRecord {
    var id: Int64
    var testName: String?
}
