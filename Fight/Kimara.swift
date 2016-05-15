//
//  Kimara.swift
//  Fight
//
//  Created by Vitaly Some on 5/15/16.
//  Copyright © 2016 Vitaliy. All rights reserved.
//

import Foundation

class Kimara: Enemy {
    
    let IMMUNE_MAX = 15
    
    override var loot: [String] {
        return ["Ruby staff", "Jeggins"]
    }
    
    override var type: String {
        return "Kimara"
    }
    
    override func attemptAttack(attackPower: Int) -> Bool {
        if attackPower > IMMUNE_MAX {
            super.attemptAttack(attackPower)
            return true
        } else {
            return false
        }
    }
}
