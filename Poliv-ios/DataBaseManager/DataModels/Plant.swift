//
//  Plant.swift
//  Poliv-ios
//
//  Created by artem on 15.05.2024.
//

import Foundation
import GRDB

struct Plants: Identifiable, Codable, FetchableRecord, PersistableRecord {
    let id: Int64
    let Name: String
    let Age: String?
    let Vid: String
    let Comm: String
    let Height: String
    let Breeding: String
    let Bloom: String
    let Popular: String?
}
