//
//  ViewController.swift
//  rpgoop
//
//  Created by Daniel J Janiak on 3/15/16.
//  Copyright © 2016 Daniel J Janiak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet var printLabel: UILabel!
    @IBOutlet var playerHPLabel: UILabel!
    @IBOutlet var enemyHPLabel: UILabel!
    
    @IBOutlet var enemyImg: UIImageView!
    
    @IBOutlet var chestButton: UIButton!
    
    var player: Player!
    var enemy: Enemy!
    var chestMessage: String?
    
    @IBAction func onChestTapped(sender: AnyObject) {
        
        chestButton.hidden = true
        printLabel.text = chestMessage
        NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: "generateRandomEnemy", userInfo: nil, repeats: false)
    }
    
    @IBAction func attackTapped(sender: AnyObject) {
        
        if enemy.attemptAttack(player.attackPwr) {
            printLabel.text = "Attacked \(enemy.type) for \(player.attackPwr) HP"
            enemyHPLabel.text = "\(enemy.hp) HP"
        } else {
            printLabel.text = "Attack was unsuccessful!"
        }
        
        if let loot = enemy.dropLoot() {
            
            player.addItemToInventory(loot)
            chestMessage = "\(player.name) found \(loot)"
            chestButton.hidden = false
            
        }
        
        if !enemy.isAlive {
            enemyHPLabel.text = ""
            printLabel.text = "Killed \(enemy.type)"
            enemyImg.hidden = true
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        player = Player(name: "DirtyLaundry21", hp: 110, attackPwr: 20)
        playerHPLabel.text = "\(player.hp) HP"
        
        generateRandomEnemy()
        
    }
    
    func generateRandomEnemy() {
        
        let rand = Int(arc4random_uniform(2))
    
        if rand == 0 {
            enemy = Kimara(startingHp: 50, attackPwr: 12)
        } else {
            enemy = DevilWizard(startingHp: 60, attackPwr: 15)
        }
        
        enemyImg.hidden = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

