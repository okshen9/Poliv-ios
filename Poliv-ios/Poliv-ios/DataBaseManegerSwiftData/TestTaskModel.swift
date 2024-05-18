//
//  TestTaskModel.swift
//  Poliv-ios
//
//  Created by artem on 18.05.2024.
//

import Foundation
import UIKit
import SwiftData

@Model
final class TestTaskModel {
    @Attribute(.unique)
    let id: UUID
    
    let name: String
    
    init(name: String) {
        
        self.id = UUID()
        self.name = name
    }
}
