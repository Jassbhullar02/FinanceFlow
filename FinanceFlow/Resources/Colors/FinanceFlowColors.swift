import SwiftUI

extension Color {
    static let ffPrimary = Color(hex: 0xE0533D)
    static let ffPrimaryDeep = Color(hex: 0x469B88)
    static let ffInk = Color(hex: 0x242424)
    static let ffMuted = Color(red: 0.44, green: 0.48, blue: 0.54)
    static let ffSurface = Color(hex: 0xF3F3F3)
    static let ffCard = Color(hex: 0xFFFFFF)
    static let ffLine = Color(hex: 0xE9E9E9)
    static let ffWarning = Color(hex: 0xEED868)
    static let ffExpense = Color(hex: 0xE0533D)
    static let ffBlue = Color(hex: 0x377CC8)
    static let ffLavender = Color(hex: 0x9DA7D0)
    static let ffPink = Color(hex: 0xE78C9D)
    static let ffSoftPink = Color(hex: 0xFFE9F6)
    static let ffSoftBlue = Color(hex: 0xEDEEFF)
    static let ffSoftYellow = Color(hex: 0xFFF5D9)
    static let ffSoftGreen = Color(hex: 0xE7F8EA)
}

extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xFF) / 255,
            green: Double((hex >> 8) & 0xFF) / 255,
            blue: Double(hex & 0xFF) / 255,
            opacity: alpha
        )
    }
}

extension ShapeStyle where Self == Color {
    static var ffPrimary: Color { .ffPrimary }
    static var ffPrimaryDeep: Color { .ffPrimaryDeep }
    static var ffInk: Color { .ffInk }
    static var ffMuted: Color { .ffMuted }
    static var ffSurface: Color { .ffSurface }
    static var ffCard: Color { .ffCard }
    static var ffLine: Color { .ffLine }
    static var ffWarning: Color { .ffWarning }
    static var ffExpense: Color { .ffExpense }
    static var ffBlue: Color { .ffBlue }
    static var ffLavender: Color { .ffLavender }
    static var ffPink: Color { .ffPink }
    static var ffSoftPink: Color { .ffSoftPink }
    static var ffSoftBlue: Color { .ffSoftBlue }
    static var ffSoftYellow: Color { .ffSoftYellow }
    static var ffSoftGreen: Color { .ffSoftGreen }
}
