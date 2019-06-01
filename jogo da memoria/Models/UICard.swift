//
//  UICard.swift
//  jogo da memoria
//
//  Created by Marielle Wronka on 01/06/2019.
//  Copyright © 2019 Cwi Software. All rights reserved.
//

import UIKit

class UICard: UIButton {
    var animator: UIViewPropertyAnimator? = nil
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.animator = UIViewPropertyAnimator(duration: 1.0, curve: .easeOut){
            self.alpha = 0.0
        }
    }
}
