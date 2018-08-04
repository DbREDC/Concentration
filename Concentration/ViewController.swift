//
//  ViewController.swift
//  Concentration
//
//  Created by 孙鹏鹏 on 2018/8/4.
//  Copyright © 2018年 孙鹏鹏. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var buttonIndex = [Int](0..<30)
    var lastButton = 0
    let buttonImage = ["👻","🎃","⌚️","🎁","🚗","🏀","🐶","🐤","😄","🍓","🍒","🍞","🍺","🎲","🎹"]
    
    
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
            let chooseImage = buttonIndex[index]%15
            flipCard(withEmoji: buttonImage[chooseImage], on: sender)
            lastButton = index
        }
    }
    
    func flipCard(withEmoji emoji: String,on button: UIButton){
        if button.currentTitle == emoji {
            button.setTitle("", for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        }else{
            button.setTitle(emoji, for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
        if flipCount%2==0 {
            if lastButton == cardButton.index(of: button){
                button.removeFromSuperview()
                cardButton[lastButton].removeFromSuperview()
            }
//                button.setTitle("", for: UIControlState.normal)
//                button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
//                cardButton[lastButton].setTitle("", for: UIControlState.normal)
//                cardButton[lastButton].backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0,
        }
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        shuffleArray()
        
    }
    
    func shuffleArray() {
        let count = buttonIndex.count
        for i in 0..<count {
            let j = Int(arc4random_uniform(UInt32(count-i))) + i
            if i != j {
                (buttonIndex[i], buttonIndex[j])=(buttonIndex[j], buttonIndex[i])
            }
        }
    }
   
}

