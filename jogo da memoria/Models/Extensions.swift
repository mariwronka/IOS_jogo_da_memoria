//
//  Extensions.swift
//  jogo da memoria
//
//  Created by Marielle Wronka on 25/05/2019.
//  Copyright © 2019 Cwi Software. All rights reserved.
//

import Foundation

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
