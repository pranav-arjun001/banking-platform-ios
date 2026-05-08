//
//  Colors.swift
//  banking-platform-ios-app
//
//  Created by Pranav Arjun on 01/05/26.
//

import SwiftUI

extension Color {
    static let background = Color(hex: "#F4F4F4")
    static let cardDark = Color(hex: "#25253D")
    static let cardAccent = Color(hex: "#324AA8")
    static let textPrimary = Color(hex: "#1E1E2D")
    static let textSecondary = Color(hex: "#7E848D")
    static let accent = Color(hex: "#0066FF")
    static let border = Color(hex: "#232533")
    static let surface = Color(hex: "#FFFFFF")
    static let surfaceMuted = Color(hex: "#F3F3F6")
    static let iconMuted = Color(hex: "#ECECF1")
    static let divider = Color(hex: "#E8E8EE")
    static let success = Color(hex: "#20B15A")
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 6:
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
