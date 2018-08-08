//
//  Concentration.swift
//  Concentration
//
//  Created by 孙鹏鹏 on 2018/8/8.
//  Copyright © 2018年 孙鹏鹏. All rights reserved.
//

import Foundation
class Concentration {
    
    var cards = [Card]()
    
    func touchCard(at index:Int) {
        if cards[index].isFaceup {
            cards[index].isFaceup = false
        } else {
            cards[index].isFaceup = true
        }
        
    }
    
    init(numberOfPairsOfCards: Int) {
        for _ in 0..<numberOfPairsOfCards{
            let card = Card()
            cards += [card,card]
            
        }
        
        for cardIndex in cards.indices {
            let changeCardIndex = Int(arc4random_uniform(UInt32(cards.count-cardIndex))) + cardIndex
            if cardIndex != changeCardIndex {
                (cards[cardIndex], cards[changeCardIndex])=(cards[changeCardIndex], cards[cardIndex])
            }
        }
        
        
    }
    
}
