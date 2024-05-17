import Foundation
import GRDB

struct TestTable: Identifiable, Codable, FetchableRecord, PersistableRecord {
    var id: Int64
    var name: String
    var imageName: String { return name }
}
