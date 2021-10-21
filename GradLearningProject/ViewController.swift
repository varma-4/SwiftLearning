//
//  ViewController.swift
//  GradLearningProject
//
//  Created by Mani on 12/10/21.
//

import UIKit

class ViewController: UIViewController {

    var numberOnScreen : Double = 0;
    var previousNumber : Double = 0
    var performingMath = false
    var operation = 0
    var runningNumber = ""
    
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    @IBAction func numbers(_ sender: UIButton) {
        runningNumber = String(numberOnScreen)
        
        if performingMath == true{
            label.text =  String(sender.tag)
            numberOnScreen = Double(sender.tag)
            performingMath = false
        }
        else{
        label.text = label.text! + String(sender.tag)
        numberOnScreen = Double(label.text!)!
        
        }
        
    }
    
    
    @IBAction func buttons(_ sender: UIButton) {
        
        if label.text != "" && sender.tag != 10 && sender.tag != 15 && sender.tag != 17  {
            
            previousNumber = Double(label.text!)!
           
            label.text =  sender.currentTitle!
            
            
            operation = sender.tag
            performingMath = true
        }
        else if sender.tag == 15
        {
            if operation == 11
            {
                label.text = String(previousNumber / numberOnScreen)
            }
           else if operation == 12
            {
            label.text = String(previousNumber * numberOnScreen)
            }
            else if operation == 13
            {
                label.text = String(previousNumber - numberOnScreen)
            }
            else if operation == 14
            {
                label.text = String(previousNumber + numberOnScreen)
            }
        
            
            else{
                label.text = String(numberOnScreen)
            }
            

        }
        
        else if sender.tag == 10{
            label.text = ""
            previousNumber = 0
            numberOnScreen = 0
            operation = 0
        }
        else if sender.tag == 17{
            label.text = ""
            numberOnScreen = 0
            
        }
        
    }
    
    
    @IBAction func dotpressed(_ sender: RoundButton) {
        
        runningNumber = String(numberOnScreen)
        if runningNumber.count <= 7{
            runningNumber += "."
            label.text = runningNumber
        }
    }
    
}

