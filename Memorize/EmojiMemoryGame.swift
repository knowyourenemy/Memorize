//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Aaditya Patwari on 20/11/23.
//

import SwiftUI


class EmojiMemoryGame: ObservableObject {
    
    private static let themes = [
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
    
    
    
    private static func createMemoryGame(theme: Theme) -> MemoryGame<String> {
        return MemoryGame(numberOfPairsOfCards: theme.numberOfPairs) { pairIndex in
            let emojis = theme.emojis.shuffled()
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex]
            } else {
                return "⁉️"
            }
        }
    }
    
    @Published private var model: MemoryGame<String>;
    
    private let theme: Theme;
    
    init(){
        theme = EmojiMemoryGame.themes.randomElement()!
        model = EmojiMemoryGame.createMemoryGame(theme: theme)
    }
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    var themeColor: Color {
        switch theme.color {
        case "orange": 
            return .orange
        case "blue":
            return .blue
        case "brown":
            return .brown
        default:
            return .green
        }
    }
    
    var themeName: String {
        return theme.name
    }
    
    // MARK: - Intents
    
    func shuffle() {
        model.shuffle()
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
}
