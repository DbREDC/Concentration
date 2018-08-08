//
//  ViewController.swift
//  Concentration
//
//  Created by 孙鹏鹏 on 2018/8/4.
//  Copyright © 2018年 孙鹏鹏. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game = Concentration(numberOfPairsOfCards: (cardButton.count + 1) / 2)
    
    var flipCount = 0 {
        didSet{
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    @IBOutlet var cardButton: [UIButton]!
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBAction func touchButton(_ sender: UIButton) {
        flipCount += 1
        if let index = cardButton.index(of: sender){
            game.touchCard(at: index)
            updateViewFromModel()
        }
    }
    
    func updateViewFromModel() {
        for index in cardButton.indices {
            let button = cardButton[index]
            let card = game.cards[index]
            if card.isFaceup {
                button.setTitle(emoji(card.identifier), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }else {
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatchCard ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
                
            }
        }
    }
    
    let buttonEmoji = ["👻","🎃","⌚️","🎁","🚗","🏀","🐶","🐤","😄","🍓","🍒","🍞","🍺","🎲","🎹","😉"]

    func emoji(_ index: Int) -> String {
        return buttonEmoji[index]
    }
    
}








