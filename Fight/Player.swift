//
//  Player.swift
//  Fight
//
//  Created by Vitaly Some on 5/15/16.
//  Copyright © 2016 Vitaliy. All rights reserved.
//

import Foundation

class Player: Character {

    private var _name: String = "Player"
    
    private var _inventory: [String] = []
    
    var name: String {
        get {
            return _name
        }
    }
    
    var inventory: [String] {
        get {
            return _inventory
        }
    }
    
    convenience init(name: String, startingHp: Int, attackPower: Int) {
        self.init(startingHp: startingHp, attackPower: attackPower)
        _name = name
    }
    
}