//
//  ExtenstionColor.swift
//  Poliv-ios
//
//  Created by artem on 10.05.2024.
//

import Foundation
import SwiftUI

/// Разширение Цветовой палитры
extension ShapeStyle where Self == Color {
    static var gray80: Color { Color.gray.opacity(0.8) }
    static var white80: Color { Color.white.opacity(0.8) }
}
