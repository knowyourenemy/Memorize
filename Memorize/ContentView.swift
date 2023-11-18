//
//  ContentView.swift
//  Memorize
//
//  Created by Aaditya Patwari on 4/11/23.
//

import SwiftUI

struct ContentView: View {
    let halloweenTheme: Array<String> = ["👻", "🎃", "🕷️", "😈", "💀", "🕸️", "🧙‍♀️", "🙀", "👹", "😱", "☠️", "🍭"]
    let vehicleTheme: Array<String> = ["🚗", "🚀", "✈️", "🚎", "🚛", "🚊", "🚡", "🛳️", "🚑", "🚁", "🚲", "🛴"]
    let faceTheme: Array<String> = ["😀", "😁", "😆", "🥹", "😅", "😂", "🥲", "🙃", "😉", "🤪", "😘", "😒"]
    let minPairCount = 4
    let maxPairCount = 12
    
    
    @State var currentTheme: Array<String>?
    
    @State var cardCount = 0
    
    var body: some View {
        VStack {
            ScrollView {
                cards
            }
                Spacer()
                themePickers
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]){
            if let currentTheme = currentTheme {
                ForEach(0..<cardCount, id: \.self) { index in
                    CardView(content: currentTheme[index])
                        .aspectRatio(2/3, contentMode: .fit)
                }
            }
        }.foregroundColor(.orange)
    }
    
    var themePickers: some View {
        HStack(spacing: 50) {
            halloweenThemePicker
            vehicleThemePicker
            faceThemePicker
        }

    }
    
    func themePicker(label: String, symbol: String, theme: Array<String>) -> some View {
            Button(action: {
                currentTheme = theme
                cardCount = Int.random(in: minPairCount...maxPairCount)
            }, label: {
                VStack {
                    Image(systemName: symbol).imageScale(.large).font(.largeTitle).frame(height: 50)
                    Text(label)
                }
            })
//        .disabled(cardCount + offset < 1 || cardCount + offset > currentTheme.count)
    }
    
    var halloweenThemePicker: some View {
        themePicker(label: "Halloween", symbol: "star.fill", theme: halloweenTheme)
    }
    
    var vehicleThemePicker: some View {
        themePicker(label: "Vehicle", symbol: "car.fill", theme: vehicleTheme)
    }
    
    var faceThemePicker: some View {
        themePicker(label: "Face", symbol: "face.smiling.fill", theme: faceTheme)
    }
}

struct CardView: View {
    var content: String
    @State var isFaceUp = true
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
        }.onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
