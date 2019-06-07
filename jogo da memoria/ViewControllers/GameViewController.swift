//
//  ViewController.swift
//  jogo da memoria
//
//  Created by Marielle Wronka on 25/05/2019.
//  Copyright © 2019 Cwi Software. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var flipCountLabel: UILabel!

    @IBOutlet var buttonsArray: [UIButton]!
    
    var animete = false
    
    var cardTextProvider: CardTextProvider!
    
    @IBAction func touchNewGame(_ sender: UIButton) {
        for index in game.cards.indices {
            let card = self.game.cards[index]
            if card.isFaceUp == false { return }
        }
        
        game = Game(numberOfPairOfCards: buttonsArray.count / 2)
        flipCount = 0
        
        for index in game.cards.indices {
            let button = self.buttonsArray[index]
            button.setBackgroundImage(UIImage(named: "card_back.png"), for: .normal)
            button.setTitle(" ", for: .normal)
        }
        
    }
    
    var flipCount = 0 { didSet { flipCountLabel.text = "Flips: \(flipCount)" } }
    
    lazy var game = Game(numberOfPairOfCards: buttonsArray.count / 2)

    @IBAction func touchCard(_ sender: UIButton) {
        if let cardNumber = buttonsArray.firstIndex(of: sender) {
            if game.cards[cardNumber].cardState == .back {
                
                self.game.chooseCard(card: cardNumber)
                self.updateViewFromModel()
                self.flipCount += 1
                
                if self.game.win {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
                        self.performSegue(withIdentifier: "win-segue", sender: nil)
                    })
                }
            }
        }
    }
    
    func updateViewFromModel() {
        for (index, card) in game.cards.enumerated() {
            let button = self.buttonsArray[index]
            let text = self.cardTextProvider.text(for: card.identifier)
            
            if self.game.win {
                button.setBackgroundImage(UIImage(named: "card_front.png"), for: .normal)
                button.setTitle(text, for: .normal)
            } else if card.cardState == .matched {
                button.setBackgroundImage(nil, for: .normal)
                button.setTitle(" ", for: .normal)
            } else if card.cardState == .front {
                button.setBackgroundImage(UIImage(named: "card_front.png"), for: .normal)
                button.setTitle(text, for: .normal)
            } else {
                button.setBackgroundImage(UIImage(named: "card_back.png"), for: .normal)
                button.setTitle(" ", for: .normal)
            }
        }
    }
}
