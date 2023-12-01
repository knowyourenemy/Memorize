//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Aaditya Patwari on 20/11/23.
//

import Foundation

struct MemoryGame<CardContent> {
    private(set) var cards: Array<Card>
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        // add numberOfPairsOfCards x 2 cards
        for pairIndex in 0..<max(2, numberOfPairsOfCards) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
    
    func choose(_ card: Card){
        
    }
    
    mutating func shuffle(){
        cards.shuffle()
    }
    
    struct Card: Equatable {
        static func == (lhs: Card, rhs: Card) -> Bool {
            return true
        }
        
        var isFaceUp = true
        var isMatched = false
        let content: CardContent
    }
}
