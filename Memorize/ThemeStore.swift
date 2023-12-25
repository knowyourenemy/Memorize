//
//  ThemeStore.swift
//  Memorize
//
//  Created by Aaditya Patwari on 22/12/23.
//

import SwiftUI

extension UserDefaults {
    func themes(forKey key: String) -> [Theme] {
        if let jsonData = data(forKey: key),
           let decodedThemes = try? JSONDecoder().decode([Theme].self, from: jsonData) {
            return decodedThemes
        } else {
            return []
        }
    }
    func set(_ themes: [Theme], forKey key: String) {
        let data = try? JSONEncoder().encode(themes)
        set(data, forKey: key)
    }
}

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
    var themes: [Theme] {
        get {
            UserDefaults.standard.themes(forKey: "Themes")
        }
        set {
            if !newValue.isEmpty {
                UserDefaults.standard.set(newValue, forKey: "Themes")
                objectWillChange.send()
            }
        }
    }
    
    init() {
        if themes.isEmpty {
            themes = ThemeStore.builtins
        }
    }

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

