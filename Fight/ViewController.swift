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
    var isLooted: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        player = Player(name: "Croaton", startingHp: 66, attackPower: 20)
    
        generateEnemy()
        
        playerHpLabel.text = player.formattedHp()
        enemyHpLabel.text = enemy.formattedHp()
        printLabel.text = "\(player.name) attacked by \(enemy.type)"
        
    }
    
    @IBAction func onAttackTapped(sender: UIButton) {
        if enemy.isAlive && player.isAlive {
            getFight()
        }
    }
    
    @IBAction func onChestTapped(sender: UIButton) {
        let loot = enemy.dropLoot()!
        player.getLoot(loot)
       
        if isLooted == false {
            printLabel.text = "Congratulations! You get the [\(loot)]"
            isLooted = true
        } else {
            printLabel.text = "Chest is empty :("
        }
    }
    
    private func getFight() {
        playerAttacked()
        enemyAttacked()
    }
    
    private func playerAttacked() {
        enemy.attemptAttack(player.attackPower)
        
        if enemy.isAlive {
            enemyHpLabel.text = enemy.formattedHp()
            printLabel.text = "Attacked \(enemy.type) for \(player.attackPower) HP"
        } else {
            enemyHpLabel.hidden = true
            enemyImage.hidden = true
            printLabel.text = "\(player.name) wins"
        }
    }
    
    private func enemyAttacked() {
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

