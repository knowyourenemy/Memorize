//
//  ThemeStore.swift
//  Memorize
//
//  Created by Aaditya Patwari on 22/12/23.
//

import SwiftUI

class ThemeStore: ObservableObject {
    static let builtins = [
        Theme(
            name: "Halloween",
            emojis: ["👻", "🎃", "🕷️", "😈", "💀", "🕸️", "🧙‍♀️", "🙀", "👹", "😱", "☠️", "🍭"],
            numberOfPairs: 8,
            color: RGBA(color: .green)
        ),
        Theme(
            name: "Vehicles",
            emojis: ["🚗", "🚀", "✈️", "🚎", "🚛", "🚊", "🚡", "🛳️", "🚑", "🚁", "🚲", "🛴"],
            numberOfPairs: 10,
            color: RGBA(color: .blue)
        ),
        Theme(
            name: "faces",
            emojis: ["😀", "😁", "😆", "🥹", "😅", "😂", "🥲", "🙃", "😉", "🤪", "😘", "😒"],
            numberOfPairs: 12,
            color: RGBA(color: .brown)
        )
    ]
    @Published var themes = builtins

}

extension Color {
    init(rgba: RGBA) {
        self.init(.sRGB, red: rgba.red, green: rgba.green, blue: rgba.blue, opacity: rgba.alpha)
    }
}
extension RGBA {
    init(color: Color) {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        UIColor(color).getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        self.init(red: Double(red), green: Double(green), blue: Double(blue), alpha: Double(alpha))
    }
}

