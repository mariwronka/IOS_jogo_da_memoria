//
//  Card.swift
//  jogo da memoria
//
//  Created by Marielle Wronka on 01/06/2019.
//  Copyright © 2019 Cwi Software. All rights reserved.
//

import Foundation

struct Card {
    
    var identifier : Int
    var isFaceUp: Bool = false
    var isMatched: Bool = false
    var cardState: CardState {
        if isMatched { return .matched }
        else if isFaceUp { return .front }
        else { return .back }
    }
    
    init(identifier: Int) {
        self.identifier = identifier
    }
    
}

enum CardState {
    
    case back, front, matched
    
}
