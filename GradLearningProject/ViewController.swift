//
//  ViewController.swift
//  GradLearningProject
//
//  Created by Mani on 12/10/21.
//

import UIKit

enum Operation: String {
    case add = "+"
    case substract = "-"
    case divide = "/"
    case multiply = "x"
    case NULL = "Null"
}

class ViewController: UIViewController {

    // Label Outlet
    @IBOutlet weak var label: UILabel!
    // variables for performing calculation
    var numberOnScreen = ""
    var leftValue = ""
    var rightValue = ""
    var result = ""
    var operation: Operation = .NULL
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        label.text = "0"
    }
    // 0-9 Button Actions
    @IBAction func numbers(_ sender: RoundButton) {
        if numberOnScreen.count <= 8 {
        numberOnScreen += "\(sender.tag)"
        label.text = numberOnScreen
   }
    }
    // All Clear Button Action
    @IBAction func allClear(_ sender: RoundButton) {
        numberOnScreen = ""
        leftValue = ""
        rightValue = ""
        result = ""
        operation = .NULL
        label.text = "0"
    }
    // Divide Operation
    @IBAction func divOp(_ sender: RoundButton) {
        operationfunc(oper: .divide)

    }
    // Multiplication
    @IBAction func mulOp(_ sender: RoundButton) {
        operationfunc(oper: .multiply)

    }
    // Substraction
    @IBAction func minusOp(_ sender: RoundButton) {
        operationfunc(oper: .substract)

    }
    // Addition
    @IBAction func addOp(_ sender: RoundButton) {
        operationfunc(oper: .add)
    }
    // Equal To Button
    @IBAction func equal(_ sender: RoundButton) {
        operationfunc(oper: operation)

    }
    // Dot button
    @IBAction func dot(_ sender: RoundButton) {
        if numberOnScreen.count <= 7 {
        numberOnScreen += "."
        label.text = numberOnScreen
    }
    }
    // Performing Calculation
    func operationfunc(oper: Operation) {
        var left = 0.0
        var right = 0.0
        var res = 0.0
        if operation != .NULL {
            if numberOnScreen != ""{
                // If operation is not null and there is some number on screen
                rightValue = numberOnScreen
                numberOnScreen = ""
                if let leftv = Double(leftValue) {
                    left = leftv
                }
                if let rightv = Double(rightValue) {
                    right = rightv
                }
                switch operation {
                case .add : result = "\(left + right)"
                case .substract : // Performing Sustraction
                                    result = "\(left - right)"
                case .multiply : // Performing Multiplication
                                    result = "\(left * right)"
                case .divide : // Performing Division
                                    result = "\(left / right)"
                case .NULL : print("No operation")
                }
                if let resultv = Double(result) {
                    res = resultv
                }
                leftValue = result
                if res.truncatingRemainder(dividingBy: 1) == 0 {
                    // if the numbers are integer then converting the result back to integer
                    result = "\(Int(res))"
                }
                // printing result
                label.text = result
            }
            // storing the operation for further calculation
            operation = oper
        } else {
            // for the first number
            leftValue = numberOnScreen
            numberOnScreen = ""
            operation = oper
        }
    }
}
