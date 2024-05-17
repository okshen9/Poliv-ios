import Foundation
import SwiftUI

/// Раcширение Цветовой палитры
extension ShapeStyle where Self == Color {
    static var gray80: Color { Color.gray.opacity(0.8) }
    static var white80: Color { Color.white.opacity(0.8) }
}
