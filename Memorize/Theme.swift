//
//  Theme.swift
//  Memorize
//
//  Created by Aaditya Patwari on 1/12/23.
//

import Foundation

struct Theme: Hashable, Identifiable {
    var id = UUID()
    var name: String;
    var emojis: Array<String>;
    var numberOfPairs: Int;
    var color: RGBA;
}

struct RGBA: Codable, Equatable, Hashable {
    let red: Double
    let green: Double
    let blue: Double
    let alpha: Double
}
