//
//  Theme.swift
//  Memorize
//
//  Created by Aaditya Patwari on 1/12/23.
//

import SwiftUI

struct Theme: Hashable, Identifiable {
    var id: String { name }
    
    let name: String;
    let emojis: Array<String>;
    let numberOfPairs: Int;
    let color: String;
}
