//
//  Theme.swift
//  Memorize
//
//  Created by Aaditya Patwari on 1/12/23.
//

import SwiftUI

struct Theme: Hashable, Identifiable {
    var id = UUID()
    var name: String;
    var emojis: Array<String>;
    var numberOfPairs: Int;
    var color: String;
}
