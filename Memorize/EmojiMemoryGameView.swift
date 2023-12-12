//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Aaditya Patwari on 4/11/23.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    private let aspectRatio: CGFloat = 2/3
    private let spacing: CGFloat = 4
    
    var body: some View {
        VStack {
            cards
                .animation(.default, value: viewModel.cards)
                .foregroundColor(viewModel.color)
            
            Button("Shuffle") {
                viewModel.shuffle()
            }
        }
    }
    
    private var cards: some View {
        AspectVGrid(viewModel.cards, aspectRatio: aspectRatio) { card in
            CardView(card)
                .padding(spacing)
                .onTapGesture {
                    viewModel.choose(card)
                }
        }
        
    }
    
}


#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
}
