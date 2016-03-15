//
//  Player.swift
//  rpgoop
//
//  Created by Daniel J Janiak on 3/15/16.
//  Copyright © 2016 Daniel J Janiak. All rights reserved.
//

import Foundation

class Player: Character {
    
    private var _name = "Player"
    
    var name: String {
        get {
            return _name
        }
    }
    
    private var _inventory = [String]()
    
    // Make a computed property for this too / "accessor" / "getter"
    var inventory: [String] {
        return _inventory
    }
    
    func addItemToInventory(item: String) {
        _inventory.append(item)
    }
    
    convenience init(name: String, hp: Int, attackPwr: Int) {

        self.init(startingHp: hp, attackPwr: attackPwr)
        
        _name = name
    }
    
    
}