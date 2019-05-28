//
//  ViewController.swift
//  jogo da memoria
//
//  Created by Marielle Wronka on 25/05/2019.
//  Copyright © 2019 Cwi Software. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var buttonNewGame: UIButton!

    @IBOutlet weak var flipCountLabel: UILabel!

    @IBOutlet var buttonsArray: [UIButton]!
    
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
    
    var emojisOptions: Array<String> = ["🦊", "🦋", "🐼", "🐤",  "🐸", "🐹", "🐻"]
    
    var emojis = [Int:String]()
    
    lazy var game = Game(numberOfPairOfCards: buttonsArray.count / 2)

    override func viewDidLoad() {
        super.viewDidLoad()
        buttonNewGame.layer.cornerRadius = 10
    }
    
    @IBAction func touchCard(_ sender: UIButton) {
        if let cardNumber = buttonsArray.firstIndex(of: sender) {
            game.chooseCard(card: cardNumber)
            updateViewFromModel()
            flipCount += 1 
        }
    }
    
    func updateViewFromModel() {
        for index in game.cards.indices {
            let button = self.buttonsArray[index]
            let card = self.game.cards[index]
            
            if card.cardState == .matched {
                button.setBackgroundImage(nil, for: .normal)
                button.setTitle(" ", for: .normal)
            } else if card.cardState == .front {
                button.setBackgroundImage(UIImage(named: "card_front.png"), for: .normal)
                button.setTitle(emoji(for: card), for: .normal)
            } else {
                button.setBackgroundImage(UIImage(named: "card_back.png"), for: .normal)
                button.setTitle(" ", for: .normal)
            }
        }
    }

    
    func emoji(for card: Card) -> String {
        if let emoji = emojis[card.identifier] { return emoji }
        
        let emoji = emojisOptions.removeRandom()
        emojis[card.identifier] = emoji
        
        return emoji
    }
    
}

