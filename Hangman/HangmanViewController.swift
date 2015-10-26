//
//  ViewController.swift
//  Hangman
//
//  Created by Gene Yoo on 10/13/15.
//  Copyright © 2015 cs198-ios. All rights reserved.
//

import UIKit

class HangmanViewController: UIViewController {

    @IBOutlet weak var flowerImage: UIImageView!
    @IBOutlet weak var knownStringTextView: UITextField!
    @IBOutlet weak var alphabetBtn: UIButton!
    @IBOutlet weak var guessBtn: UIButton!
    let alphaList = [26:"A", 1:"B", 2:"C", 3:"D", 4:"E", 5:"F", 6:"G", 7:"H", 8:"I", 9:"J", 10:"K",
        11:"L", 12:"M", 13:"N", 14:"O", 15:"P", 16:"Q", 17:"R", 18:"S", 19:"T", 20:"U", 21:"V",
        22:"W", 23:"X", 24:"Y", 25:"Z"]
    var currentFlowerNum = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        knownStringTextView.text = HangmanAPI?.knownString
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func guessBtnClicked(sender: AnyObject) {
    }
    
    @IBAction func alphabetClicked(sender: UIButton) {
        sender.backgroundColor = UIColor.yellowColor() // UIColor.magentaColor()
        sender.enabled = false
        let tag = sender.tag
        let letter = alphaList[tag]
        
        let guessedCorrect = HangmanAPI?.guessLetter(letter!)
        if (guessedCorrect == true) {
            knownStringTextView.text = HangmanAPI?.knownString
            if (HangmanAPI?.knownString == HangmanAPI?.answer) {
                flowerImage.image = UIImage(named: "winner")
                knownStringTextView.text = "\"" + (HangmanAPI?.answer)! + "\" Click New Game!"
                
            }
        } else {
            currentFlowerNum = currentFlowerNum + 1
            flowerImage.image = UIImage(named: "flower"+String(currentFlowerNum))
            if (currentFlowerNum == 7) {
                flowerImage.image = UIImage(named: "loser")
                knownStringTextView.text = "Answer was: " + (HangmanAPI?.answer)! + " Click New Game!"
            }
        }
    }
    
    @IBAction func newGameClicked(sender: AnyObject) {
        HangmanAPI?.start()
        flowerImage.image = UIImage(named: "flower0")
        currentFlowerNum = 0
        knownStringTextView.text = HangmanAPI?.knownString

        for index in 0...26 {
            let lettBtn = self.view.viewWithTag(index) as? UIButton
            lettBtn?.enabled = true
            lettBtn?.backgroundColor = UIColor.lightGrayColor()
        }
    }
}

