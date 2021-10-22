//
//  ViewController.swift
//  GradLearningProject
//
//  Created by Mani on 12/10/21.
//

import UIKit

enum OperatorKeys: String {
    case add = "+"
    case substract = "-"
    case divide = "/"
    case multiply = "x"
    case NULL = "Null"
}

// tableview, collectionView, scrollView

class ViewController: UIViewController {

    // Label Outlet
    @IBOutlet weak var label: UILabel!
    // variables for performing calculation
    var numberOnScreen = ""
    var leftValue = ""
    var rightValue = ""
    var result = ""
    var test = ""
    private var operation: OperatorKeys = .NULL
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        label.text = "0"
    }
    // 0-9 Button Actions
    @IBAction func numbers(_ sender: RoundButton) {
        // logic ... label
        numberTapped(button: sender)
        // connecting to the label
        if label.text != numberOnScreen {
            label.text = numberOnScreen
        }
    }

    /// Appending tapped number to the calculator display
    /// - Parameter button: should be an instance of rounded button, with a tag set
    func numberTapped(button: RoundButton) {
        // description
        // Business scenario 1, at max you need to have 9 numbers displayed
        if numberOnScreen.count <= 8 {
            numberOnScreen += "\(button.tag)"
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
        test = "Performing Division"
    }
    // Multiplication
    @IBAction func mulOp(_ sender: RoundButton) {
        operationfunc(oper: .multiply)
        test = "Performing multiplication"

    }
    // Substraction
    @IBAction func minusOp(_ sender: RoundButton) {
        operationfunc(oper: .substract)
        test = "Performing Substraction"

    }
    // Addition
    @IBAction func addOp(_ sender: RoundButton) {
        operationfunc(oper: .add)
        test = "Performing Addition"
    }
    // Equal To Button
    @IBAction func equal(_ sender: RoundButton) {
        operationfunc(oper: operation)
    }
    // Dot button
    @IBAction func dot(_ sender: RoundButton) {
        dotTapped(button: sender)
        // connecting to the label
        if label.text != numberOnScreen {
            label.text = numberOnScreen
        }
        
    }
    func dotTapped(button: RoundButton ){
        if numberOnScreen.count <= 7 {
            numberOnScreen += "."
            
        }
        
    }
    
    // Performing Calculation
    func operationfunc(oper: OperatorKeys) {
        var left = 0.0
        var right = 0.0
        // First check if the operation is not null
        // bussiness rule
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
                let opp = oper
                method1(left: left, right: right, opp: opp)
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

    func method1(left: Double, right: Double, opp: OperatorKeys) {
        var res = 0.0
            switch opp {
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
    }
}
