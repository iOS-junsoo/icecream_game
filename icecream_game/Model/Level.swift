//
//  Level.swift
//  icecream_game
//
//  Created by 준수김 on 2021/10/07.
//

import Foundation

struct Level {
    var progress: Float
    var targetMoney: Int
    
    init(progress: Float, targetMoney: Int) {
        self.progress = progress
        self.targetMoney = targetMoney
    }
}

