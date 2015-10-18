//
//  ViewController.swift
//  Hangman
//
//  Created by Gene Yoo on 10/13/15.
//  Copyright © 2015 cs198-ios. All rights reserved.
//

import UIKit

class HangmanViewController: UIViewController {

    @IBOutlet weak var alphabetBtn: UIButton!
    @IBOutlet weak var guessBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func guessBtnClicked(sender: AnyObject) {
    }
    
    @IBAction func alphabetClicked(sender: UIButton) {
        sender.backgroundColor = UIColor.magentaColor()
        sender.enabled = false
        var tag = sender.tag
        print(tag)
        
    }
}

