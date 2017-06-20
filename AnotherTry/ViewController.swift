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
    var isFirstQuestion = true
    var timer = Timer()
    var counter = 25
    
    @IBOutlet weak var countingLabel: UILabel!
    @IBOutlet weak var equation: UILabel!
    @IBOutlet weak var line: UIButton!
    @IBOutlet weak var userInput: UITextField!
    @IBOutlet weak var Score: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
       
        
        view.addGestureRecognizer(tap)
        
        newQuestion()
        Timer.scheduledTimer(timeInterval: 0.1,
                                          target: self,
                                          selector: #selector(moveQuestionLabel),
                                          userInfo: nil,
                                          repeats: true)
        
        //get the variable of counter and assign it to the countingLabel
        countingLabel.text = String(counter)
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.update), userInfo: nil, repeats: true);
        
        
    }
    
    func dismissKeyboard() {
     
        view.endEditing(true)
    }
  
    
 
  
    
    func update() {
        if counter == 1 {
            let alertController = UIAlertController(title: "Game Over", message: "Time is up. Your score is: \(winCounter)", preferredStyle: .alert)
            
            let saveAction = UIAlertAction(title: "Save", style: .default, handler: {
                alert -> Void in
                
                let firstTextField = alertController.textFields![0] as UITextField
               
                
                print("firstName \(firstTextField.text)")
                
               // if firstTextField.text != "" {
                    //performSegue(withIdentifier: Segue, sender: self)
               // }
            })
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: {
                (action : UIAlertAction!) -> Void in
                
            })
            
            alertController.addTextField { (textField : UITextField!) -> Void in
                textField.placeholder = "Enter Your Name"
            }
          
            
            alertController.addAction(saveAction)
            alertController.addAction(cancelAction)
            
            
            //alert.addAction(UIAlertAction(title: "No", style: .default) { _ in
                //print("OK")
           // })
            
            self.present(alertController, animated: true, completion: nil)
        }
        counter -= 1
        countingLabel.text = String(counter)
    }
    
    //override func prepare( for segue: UIStoryboardSegue, sender: Any?){
        //var secondController = segue.destination as! SecondViewController
        //secondController.bestName = firstTextField
        
    //}
    
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
        if let text = userInput.text, text.isEmpty, !isFirstQuestion {
            winCounter -= 1
            Score.text = "\(winCounter)"
        }
        isFirstQuestion = false
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




