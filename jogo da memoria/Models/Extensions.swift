//
//  Extensions.swift
//  jogo da memoria
//
//  Created by Marielle Wronka on 25/05/2019.
//  Copyright © 2019 Cwi Software. All rights reserved.
//

import Foundation
import UIKit

extension Bool {
    
    mutating func toggle() {
        self = !self
    }
    
}

extension Array {
    
    mutating func removeRandom() -> Element {
        
        let index = Int.random(in: self.indices)
        return self.remove(at: index)
        
    }
    
}

extension UIButton {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
}
