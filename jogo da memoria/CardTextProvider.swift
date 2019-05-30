//
//  CardTextProvider.swift
//  jogo da memoria
//
//  Created by Marielle Wronka on 29/05/2019.
//  Copyright © 2019 Cwi Software. All rights reserved.
//

import Foundation

protocol CardTextProvider : AnyObject {
    
    func text(for identifier: Int) -> String
    var emojis: [Int:String] { get set }
    var emojisOptions: [String] { get set }
    
}

extension CardTextProvider {
    
    func text(for identifier: Int) -> String {
        if let emoji = emojis[identifier] { return emoji }
        
        let emoji = emojisOptions.removeRandom()
        emojis[identifier] = emoji
        
        return emoji
    }
    
}

class CuteAnimalsEmojiProvider: CardTextProvider {
    var emojis = [Int:String]()
    var emojisOptions: Array<String> = ["🦊", "🦋", "🐼", "🐤",  "🐸", "🐹", "🐻"]
    
}

class NumbersEmojiProvider: CardTextProvider {
    
    var emojis = [Int:String]()
    var emojisOptions: Array<String> = ["1", "2", "3", "4", "5", "6", "7"]
    
}
