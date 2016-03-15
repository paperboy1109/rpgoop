//
//  Enemy.swift
//  rpgoop
//
//  Created by Daniel J Janiak on 3/15/16.
//  Copyright © 2016 Daniel J Janiak. All rights reserved.
//

import Foundation

class Enemy: Character {
    
    // Computed property
    var loot: [String] {
        return ["Rusty Dagger", "Cracked Buckler"]
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