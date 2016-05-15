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
    
    @IBOutlet weak var playerImage: UIImageView!
    
    var player: Player!
    var enemy: Enemy!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        player = Player(name: "Croaton", startingHp: 66, attackPower: 23)
    
        generateEnemy()
        
        playerHpLabel.text = player.formattedHp()
        enemyHpLabel.text = enemy.formattedHp()
        printLabel.text = "\(player.name) attacked by \(enemy.type)"
        
    }

    @IBAction func onChestTapped(sender: UIButton) {
        
    }
    
    @IBAction func onAttackTapped(sender: UIButton) {
        enemy.attemptAttack(player.attackPower)
        if enemy.isAlive {
            enemyHpLabel.text = enemy.formattedHp()
        } else {
            enemyHpLabel.hidden = true
            enemyImage.hidden = true
            printLabel.text = "\(player.name) wins"
        }
        
        player.attemptAttack(enemy.attackPower)
        if player.isAlive {
            playerHpLabel.text = player.formattedHp()
        } else {
            playerHpLabel.hidden = true
            playerImage.hidden = true
            printLabel.text =  "\(enemy.type) wins"
        }
    }
    
    private func generateEnemy() {
        let rand = arc4random_uniform(2)
        
        if rand == 0 {
            enemy = Kimara(startingHp: 70, attackPower: 16)
        } else {
            enemy = DevilWizard(startingHp: 50, attackPower: 20)
        }
    }
}

