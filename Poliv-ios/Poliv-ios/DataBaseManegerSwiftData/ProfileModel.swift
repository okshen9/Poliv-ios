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
final class ProfileModel: ObservableObject, Identifiable {
    @Attribute(.unique)
    let id: UUID
    
    var imageAvatarData: Data? = UIImage(systemName: .person)?.pngData() ?? Data()
    
    init(imageAvatar: UIImage?) {
        
        self.id = UUID()
        self.imageAvatarData = imageAvatar?.pngData() ?? Data()
    }
    
    func setImage(imageAvatar: UIImage?) {
        self.imageAvatarData = imageAvatar?.pngData() ?? Data()
    }
}
