//
//  ViewController.swift
//  Fight
//
//  Created by Vitaly Some on 5/15/16.
//  Copyright © 2016 Vitaliy. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    
    @IBOutlet weak var printLabel: UILabel!
    
    @IBOutlet weak var playerHpLabel: UILabel!
    
    @IBOutlet weak var enemyHpLabel: UILabel!
    
    @IBOutlet weak var enemyImage: UIImageView!
    
    @IBOutlet weak var playerImage: UIImageView!
    
    @IBOutlet weak var chestButton: UIButton!
    
    @IBOutlet weak var playerHpImage: UILabel!
    
    @IBOutlet weak var enemyHpImage: UIImageView!
    
    var player: Player!
    var enemy: Enemy!
    
    var swordsSound: AVAudioPlayer!
    var goldSound: AVAudioPlayer!
    var deathSound: AVAudioPlayer!
    var gulpSound: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        generatePlayer()
        generateEnemy()
        
        configureSwordsSound()
        configureGoldSound()
    }
    
    @IBAction func onAttackTapped(sender: UIButton) {
        if enemy.isAlive && player.isAlive {
            getFight()
        }
    }
    
    @IBAction func onChestTapped(sender: UIButton) {
        playSound(goldSound!)
        
        let loot = enemy.dropLoot()!
        player.addItemToInventory(loot)
        
        chestButton.hidden = true
        printLabel.text = "Congratulations! You get the [\(loot)]"
        
        NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: #selector(ViewController.generateEnemy), userInfo: nil, repeats: false)
    }
    
    private func getFight() {
        playSound(swordsSound)
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
            chestButton.hidden = false
            enemyHpImage.hidden = true
            
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
            playerHpImage.hidden = true
            printLabel.text =  "\(enemy.type) wins"
        }
    }
    
    func generatePlayer() {
        player = Player(name: "Croaton", startingHp: 666, attackPower: 20)
        playerHpLabel.text = player.formattedHp()
        
    }
     
    func generateEnemy() {
        let rand = arc4random_uniform(2)
        
        if rand == 0 {
            enemy = Kimara(startingHp: 70, attackPower: 16)
        } else {
            enemy = DevilWizard(startingHp: 50, attackPower: 20)
        }
        
        enemyImage.hidden = false
        enemyHpLabel.hidden = false
        enemyHpImage.hidden = false
        enemyHpLabel.text = enemy.formattedHp()
    }
    
    private func playSound(sound: AVAudioPlayer) {
        if sound.playing {
            sound.stop()
        }
        
        sound.play()
    }
    
    private func configureSwordsSound() {
        let swordsSoundPath = NSBundle.mainBundle().pathForResource("swords", ofType: "wav")
        let swordsSoundUrl = NSURL(fileURLWithPath: swordsSoundPath!)
        
        do {
            try swordsSound = AVAudioPlayer(contentsOfURL: swordsSoundUrl)
            swordsSound.prepareToPlay()
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    private func configureGoldSound() {
        let goldSoundPath = NSBundle.mainBundle().pathForResource("gold", ofType: "wav")
        let goldSoundUrl = NSURL(fileURLWithPath: goldSoundPath!)
        
        do {
            try goldSound = AVAudioPlayer(contentsOfURL: goldSoundUrl)
            goldSound.prepareToPlay()
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
}

