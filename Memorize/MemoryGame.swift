//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Aaditya Patwari on 20/11/23.
//

import Foundation

struct MemoryGame<CardContent: Equatable> {
    private(set) var cards: Array<Card>
    private var previouslySeenCardIDs: Set<String> = []
    var score: Int = 0
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        // add numberOfPairsOfCards x 2 cards
        for pairIndex in 0..<max(2, numberOfPairsOfCards) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: "\(pairIndex+1)a"))
            cards.append(Card(content: content, id: "\(pairIndex+1)b"))
        }
        cards.shuffle()
        print(cards)
    }
    
    var indexOfOneAndOnlyFaceUpCard: Int? {
        get { cards.indices.filter { index in cards[index].isFaceUp }.only }
        set { cards.indices.forEach {
            if cards[$0].isFaceUp {
                previouslySeenCardIDs.insert(cards[$0].id)
            }
            cards[$0].isFaceUp = (newValue == $0)
        } }
    }
    
    mutating func choose(_ card: Card){
        if let chosenIndex = cards.firstIndex(of: card) {
            if !cards[chosenIndex].isFaceUp && !cards[chosenIndex].isMatched {
                if let potentialMatchIndex = indexOfOneAndOnlyFaceUpCard {
                    if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                        score += 2
                        cards[chosenIndex].isMatched = true
                        cards[potentialMatchIndex].isMatched = true
                    } else {
                        if previouslySeenCardIDs.contains(cards[chosenIndex].id) {
                            score -= 1
                        }
                        if previouslySeenCardIDs.contains(cards[potentialMatchIndex].id) {
                            score -= 1
                        }
                    }
                } else {
                    indexOfOneAndOnlyFaceUpCard = chosenIndex
                }
                cards[chosenIndex].isFaceUp = true
            }
        }
    }
    
    mutating func shuffle(){
        cards.shuffle()
    }
    
    struct Card: Equatable, Identifiable, CustomDebugStringConvertible {
        
        var isFaceUp = false
        var isMatched = false
        let content: CardContent
        
        var id: String
        
        var debugDescription: String {
            return "\(content)"
        }
    }
}

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
