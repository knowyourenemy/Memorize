//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Aaditya Patwari on 4/11/23.
//

import SwiftUI

@main
struct MemorizeApp: App {

    @StateObject var themeStore = ThemeStore()
    @StateObject var game = EmojiMemoryGame(theme: ThemeStore.builtins.first!)

    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
