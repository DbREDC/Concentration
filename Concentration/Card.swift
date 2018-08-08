//
//  Card.swift
//  Concentration
//
//  Created by 孙鹏鹏 on 2018/8/8.
//  Copyright © 2018年 孙鹏鹏. All rights reserved.
//

import Foundation
struct Card {
    var isFaceup = false
    var isMatchCard = false
    var identifier:Int
    
    static var identifierFactory = 0
    
    static func getUniqueidentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
        
    }
    
    
    init() {
        self.identifier = Card.getUniqueidentifier()
    }
}
