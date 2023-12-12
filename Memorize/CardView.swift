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
        ZStack {
            let base = RoundedRectangle(cornerRadius: Constants.cornerRadius)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: Constants.lineWidth)
                Text(card.content).font(.system(size: Constants.FontSize.largest))
                    .minimumScaleFactor(Constants.FontSize.scaleFactor)
                    .aspectRatio(1, contentMode: .fit)
                    .multilineTextAlignment(.center)
                    .padding(Constants.inset)
            }
            .opacity(card.isFaceUp ? 1 : 0)
            base.fill().opacity(card.isFaceUp ? 0 : 1)
        }
        .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
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
