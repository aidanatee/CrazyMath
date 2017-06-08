//
//  ViewController.swift
//  AnotherTry
//
//  Created by Айдана Токбаева on 6/8/17.
//  Copyright © 2017 Aidana Tokbayeva. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //data fields
    var x = 0, y = 0
    var winCounter = 0
   
    
    @IBOutlet weak var equation: UILabel!
    @IBOutlet weak var line: UIButton!
    @IBOutlet weak var userInput: UITextField!
 
    @IBOutlet weak var Score: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newQuestion()
        Timer.scheduledTimer(timeInterval: 0.2,
                                          target: self,
                                          selector: #selector(moveQuestionLabel),
                                          userInfo: nil,
                                          repeats: true)
    }
    
    // MARK: Moving Label
    
    func moveQuestionLabel() {
        if(equation.center.y >= line.center.y) {
            newQuestion()
        }
        UILabel.animate(withDuration: 0.2) {
            self.equation.center.y += CGFloat(5)
        }
    }
    
    // MARK: Generate new random question
    
    func newQuestion() {
       x = Int(arc4random_uniform(9) + 1)
       y = Int(arc4random_uniform(9) + 1)
        equation.text = "\(x) x \(y) ="
        equation.center.y = 50
        
    }
    
    //create a textfield and a submit button. If the user enters answer into textfield and presses submit button, the application should check if the answer is either right or wrong.
    
    @IBAction func SubmitButton(_ sender: AnyObject) {
        let answer = Int(userInput.text!)
        let rightAns = Int(x * y)
        if answer == rightAns {
            winCounter += 1
            Score.text = "\(winCounter)"
        }
        else{
            winCounter -= 1
            Score.text = "\(winCounter)"
        }
        
    }
    
    
    
    
    
    
}




