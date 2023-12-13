//
//  CardView.swift
//  Memorize
//
//  Created by Aaditya Patwari on 12/12/23.
//

import SwiftUI


struct CardView: View {
    typealias Card = MemoryGame<String>.Card
    
    let card: Card
    
    init(_ card: Card) {
        self.card = card
    }
    
    var body: some View {
        TimelineView(.animation(minimumInterval: 1/10)) {timeline in
            if card.isFaceUp || !card.isMatched {
                Pie(endAngle: .degrees(card.bonusPercentRemaining * 360))
                    .opacity(Constants.Pie.opacity)
                    .overlay(cardContents.padding(Constants.Pie.inset))
                    .padding(Constants.inset)
                    .cardify(isFaceUp: card.isFaceUp)
                    .transition(.scale)
            } else {
                Color.clear
            }
            
        }
       
    }
    
    var cardContents: some View {
        Text(card.content)
            .font(.system(size: Constants.FontSize.largest))
            .minimumScaleFactor(Constants.FontSize.scaleFactor)
            .aspectRatio(1, contentMode: .fit)
            .multilineTextAlignment(.center)
            .rotationEffect(.degrees(card.isMatched ? 360 : 0))
            .animation(.spin(duration: 1), value: card.isMatched)
    }
    
    private struct Constants {
        static let cornerRadius: CGFloat = 12
        static let lineWidth: CGFloat = 2
        static let inset: CGFloat = 5
        struct FontSize {
            static let largest: CGFloat = 200
            static let smallest: CGFloat = 10
            static let scaleFactor: CGFloat = smallest / largest
        }
        struct Pie {
            static let opacity: CGFloat = 0.4
            static let inset: CGFloat = 5
        }
    }
}

extension Animation {
    static func spin(duration: TimeInterval) -> Animation {
        .linear(duration: duration).repeatForever(autoreverses: false)
    }
}


#Preview {
    typealias Card = MemoryGame<String>.Card
    return VStack {
        HStack{
            CardView(Card(content: "X", id: "test1")).padding().foregroundColor(.green)
            CardView(Card(isFaceUp: true,  content: "This is very long content", id: "Test1")).padding().foregroundColor(.green)
        }
        HStack{
            CardView(Card(content: "This is very long content", id: "Test1")).padding().foregroundColor(.green)
            CardView(Card(isMatched: true, content: "This is very long content", id: "Test1")).padding().foregroundColor(.green)
        }
        
    }
    
    
    
}
