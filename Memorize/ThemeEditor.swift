//
//  ThemeEditor.swift
//  Memorize
//
//  Created by Aaditya Patwari on 22/12/23.
//

import SwiftUI

struct ThemeEditor: View {
    @Binding var theme: Theme
    @State var emojis: String
    
    init(theme: Binding<Theme>) {
        self._theme = theme
        _emojis = State(initialValue: theme.wrappedValue.emojis.joined())
        
    }
    
    
    var body: some View {
        Form {
            Section(header: Text("Name")) {
                TextField("Name", text: $theme.name)
            }
            Section(header: Text("Emojis")) {
                TextField("Emojis", text: $emojis).onChange(of: emojis) {
                    if emojis.count >= 2 {
                        theme.emojis = emojis.split(separator: "").map(String.init)
                    }
                }
            }
            Section(header: Text("Details")) {
                Picker("No. of pairs", selection: $theme.numberOfPairs) {
                    ForEach(2...theme.emojis.count, id: \.self) { numberOfPairs in
                        Text(numberOfPairs, format: .number)
                        
                    }
                }
                .pickerStyle(.menu)
                
            }
        }
    }
}

#Preview {
    struct Preview: View {
        @State var theme: Theme = ThemeStore.builtins.first!
        
        var body: some View {
            ThemeEditor(theme: $theme)
        }
    }
    return Preview()
}
