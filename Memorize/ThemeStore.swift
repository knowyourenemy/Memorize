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
            color: "orange"
        ),
        Theme(
            name: "Vehicles",
            emojis: ["🚗", "🚀", "✈️", "🚎", "🚛", "🚊", "🚡", "🛳️", "🚑", "🚁", "🚲", "🛴"],
            numberOfPairs: 10,
            color: "blue"
        ),
        Theme(
            name: "faces",
            emojis: ["😀", "😁", "😆", "🥹", "😅", "😂", "🥲", "🙃", "😉", "🤪", "😘", "😒"],
            numberOfPairs: 12,
            color: "brown"
        )
    ]
    @Published var themes = builtins

}
