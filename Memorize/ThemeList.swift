//
//  ThemeList.swift
//  Memorize
//
//  Created by Aaditya Patwari on 22/12/23.
//

import SwiftUI

struct ThemeList: View {
    @ObservedObject var store: ThemeStore
    
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(store.themes) { theme in
                    NavigationLink(value: theme) {
                        Text(theme.name)
                    }
                }
            }.navigationDestination(for: Theme.self) { theme in
                EmojiMemoryGameView(viewModel: EmojiMemoryGame(theme: theme))
            }
        }
    }
}

#Preview {
    ThemeList(store: ThemeStore())
}
