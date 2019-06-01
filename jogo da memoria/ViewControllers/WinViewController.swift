//
//  WinViewController.swift
//  jogo da memoria
//
//  Created by Marielle Wronka on 01/06/2019.
//  Copyright © 2019 Cwi Software. All rights reserved.
//

import UIKit

class WinViewController: UIViewController {

    @IBOutlet weak var buttonNewGame: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonNewGame.layer.cornerRadius = 10
    }
    

}
