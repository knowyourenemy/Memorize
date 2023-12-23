//
//  ThemeList.swift
//  Memorize
//
//  Created by Aaditya Patwari on 22/12/23.
//

import SwiftUI

struct ThemeList: View {
    @ObservedObject var store: ThemeStore
    @State private var showPaletteEditor = false
    @State private var selectedThemeID: Theme.ID?
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(store.themes) { theme in
                    NavigationLink(value: theme) {
                        Text(theme.name)
                            .swipeActions(edge: .leading, allowsFullSwipe: false) {
                                Button("Delete", role: .destructive) {
                                        store.themes.removeAll(where: {$0.id == theme.id})
                                }
                                .tint(.red)
                                Button("Edit") {
                                    selectedThemeID = theme.id
                                    showPaletteEditor = true
                                    
                                }
                                .tint(.green)

                            }
                    }
                }
            }
            
            .navigationDestination(for: Theme.self) { theme in
                EmojiMemoryGameView(viewModel: EmojiMemoryGame(theme: theme))
            }
            .toolbar {
                Button {
                    let theme = Theme(name: "", emojis: ["🐴", "🦈"], numberOfPairs: 2, color: RGBA(color: .red))
                    store.themes.append(theme)
                    selectedThemeID = theme.id
                    showPaletteEditor = true
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
        
        .sheet(isPresented: $showPaletteEditor) { [selectedThemeID] in
            if let selectedThemeID = selectedThemeID, let theme = getBindingToThemeWithID(selectedThemeID) {
                ThemeEditor(theme: theme)
            }
        }
    }
    
    private func getBindingToThemeWithID(_ id: Theme.ID) -> Binding<Theme>? {
        let themeIndex = store.themes.firstIndex(where: { $0.id == id })
        if let themeIndex {
            return $store.themes[themeIndex]
        } else {
            return nil
        }
    }
}

#Preview {
    ThemeList(store: ThemeStore())
}
