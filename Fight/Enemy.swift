//
//  Enemy.swift
//  Fight
//
//  Created by Vitaly Some on 5/15/16.
//  Copyright © 2016 Vitaliy. All rights reserved.
//

import Foundation

class Enemy: Character {
    
    var loot: [String] {
        return ["Moon dagger", "Red hat"]
    }
    
    var type: String {
        return "Grunt"
    }
    
    func dropLoot() -> String? {
        if !isAlive {
            let rand = Int(arc4random_uniform(UInt32(loot.count)))
            return loot[rand]
        }
        
        return nil
    }
}