//
//  ViewController.swift
//  Hangman
//
//  Created by Gene Yoo on 10/13/15.
//  Copyright © 2015 cs198-ios. All rights reserved.
//

import UIKit

class HangmanViewController: UIViewController {

    @IBOutlet weak var knownLetters: UILabel!
    @IBOutlet weak var guessTextfield: UITextField!
    @IBOutlet weak var guessedLettersLabel: UILabel!
    @IBOutlet weak var hangmanImageView: UIImageView!
    var hangmanGame = Hangman()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        hangmanGame.start()
        knownLetters.text = hangmanGame.knownString
        print(hangmanGame.answer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clickedGuess(sender: AnyObject) {
        if guessTextfield.text! != "" {
            hangmanGame.guessLetter(guessTextfield.text!.uppercaseString)
            print(hangmanGame.guessedLetters)
            print("guesses(): " + hangmanGame.guesses())
        
            knownLetters.text = hangmanGame.knownString
            guessedLettersLabel.text = hangmanGame.guesses()
        }
    }
    
    @IBAction func startNewGame(sender: AnyObject) {
        hangmanGame.start()
        guessTextfield.text = ""
        guessedLettersLabel.text = ""
        knownLetters.text = hangmanGame.knownString
        print(hangmanGame.answer)
    }
}

