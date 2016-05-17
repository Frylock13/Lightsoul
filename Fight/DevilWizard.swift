//
//  DevilWizard.swift
//  Fight
//
//  Created by Vitaly Some on 5/15/16.
//  Copyright © 2016 Vitaliy. All rights reserved.
//

import Foundation
class DevilWizard: Enemy {
    
    override var loot: [String] {
        return ["Magic staff", "Crystal eye", "HP bottle"]
    }
    
    override var type: String {
        return "Wizard"
    }
}