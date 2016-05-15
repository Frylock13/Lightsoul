//
//  ViewController.swift
//  Fight
//
//  Created by Vitaly Some on 5/15/16.
//  Copyright © 2016 Vitaliy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var printLabel: UILabel!
    
    @IBOutlet weak var chestButton: UIImageView!
    
    @IBOutlet weak var playerHpLabel: UILabel!
    
    @IBOutlet weak var enemyHpLabel: UILabel!
    
    @IBOutlet weak var enemyImage: UIImageView!
    
    var player: Player!
    var enemy: Enemy!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        player = Player(name: "Croaton", startingHp: 66, attackPower: 23)
    
        generateEnemy()
        
        playerHpLabel.text = "HP \(player.hp)"
        enemyHpLabel.text = "HP \(enemy.hp)"
        printLabel.text = "\(player.name) attacked by \(enemy.type)"
        
    }

    @IBAction func onChestTapped(sender: UIButton) {
        
    }
    
    func generateEnemy() {
        let rand = arc4random_uniform(2)
        
        if rand == 0 {
            enemy = Kimara(startingHp: 70, attackPower: 16)
        } else {
            enemy = DevilWizard(startingHp: 50, attackPower: 20)
        }
    }
}

