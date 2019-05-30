//
//  WelcomeViewController.swift
//  jogo da memoria
//
//  Created by Marielle Wronka on 29/05/2019.
//  Copyright © 2019 Cwi Software. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var buttonCuteAnimails: UIButton!
    @IBOutlet weak var buttonNumbers: UIButton!
    
    private let gameSegue = "show-game"
    var cardTextProvires: CardTextProvider?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonCuteAnimails.layer.cornerRadius = 10
        buttonNumbers.layer.cornerRadius = 10
    }

    @IBAction func touchCuteAnimails(_ sender: Any) {
        self.cardTextProvires = CuteAnimalsEmojiProvider()
        self.performSegue(withIdentifier: gameSegue, sender: nil)
    }
    
    @IBAction func touchNumbers(_ sender: Any) {
        self.cardTextProvires = NumbersEmojiProvider()
        self.performSegue(withIdentifier: gameSegue, sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? GameViewController {
            destination.cardTextProvider = self.cardTextProvires
        }
    }
    
}
