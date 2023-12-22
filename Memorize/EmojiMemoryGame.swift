//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Aaditya Patwari on 20/11/23.
//

import SwiftUI


class EmojiMemoryGame: ObservableObject {
    
    
    
    
    
    private static func createMemoryGame(theme: Theme) -> MemoryGame<String> {
        let emojis = theme.emojis.shuffled()
        return MemoryGame(numberOfPairsOfCards: theme.numberOfPairs) { pairIndex in
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex]
            } else {
                return "⁉️"
            }
        }
    }
    
    @Published private var model: MemoryGame<String>;
    
    private var theme: Theme;
    
    init(theme: Theme){
        self.theme = theme
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
    
    var score: Int {
        return model.score
    }
    
    // MARK: - Intents
    
    func shuffle() {
        model.shuffle()
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
    func newGame(){
        model = EmojiMemoryGame.createMemoryGame(theme: theme)
    }
    
}
