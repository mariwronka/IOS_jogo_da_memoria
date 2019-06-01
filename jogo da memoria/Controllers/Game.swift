//
//  game.swift
//  jogo da memoria
//
//  Created by Marielle Wronka on 25/05/2019.
//  Copyright © 2019 Cwi Software. All rights reserved.
//

import Foundation

class Game {
    
    var cards: [Card] = [Card]()
    
    var indexOfSelectedCard: Int?
    
    func chooseCard(card index: Int) {
        if cards.indices.contains(index), cards[index].isMatched == false {
            
            if let matchedIndex = self.indexOfSelectedCard, index != matchedIndex {
                
                if cards[matchedIndex].identifier == cards[index].identifier {
                    cards[matchedIndex].isMatched = true
                    cards[index].isMatched = true
                }
                
                cards[index].isFaceUp = true
                self.indexOfSelectedCard = nil
                
            } else {
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = cards[flipDownIndex].isMatched
                }
                cards[index].isFaceUp = true
                self.indexOfSelectedCard = index
            }
        }
    }
    
    init(numberOfPairOfCards: Int) {
        for index in 0 ..< numberOfPairOfCards {
            let card =  Card(identifier: index)
            self.cards += [card, card]
            cards.shuffle()
        }
    }
    
}
