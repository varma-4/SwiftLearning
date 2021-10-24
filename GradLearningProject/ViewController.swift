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

class ViewController: UIViewController {
    // Label Outlet
    @IBOutlet weak var label: UILabel!
    // variables for performing calculation
    var numberOnScreen = ""
    var leftValue = ""
    var rightValue = ""
    var result = ""
    var test = ""
    var operatorKey: OperatorKeys = .NULL
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
        allClearData()
        label.text = "0"
    }
    /// This method clears all the data(variables) used
    func allClearData() {
        numberOnScreen = ""
        leftValue = ""
        rightValue = ""
        result = ""
        operatorKey = .NULL
    }
    // Below 5 methods calls the operation function with different operators
    /// 1 Divide Operation
    /// - Parameter sender: should be  an instance of rounded button
    @IBAction func divOp(_ sender: RoundButton) {
        operationfunc(oper: .divide)
        test = "Performing Division"
    }
    ////// 2: Multiplication Operation
    /// - Parameter sender: should be  an instance of rounded button
    @IBAction func mulOp(_ sender: RoundButton) {
        operationfunc(oper: .multiply)
        test = "Performing multiplication"
    }
    /// 3: Substraction Operation
    /// - Parameter sender: should be  an instance of rounded button
    @IBAction func minusOp(_ sender: RoundButton) {
        operationfunc(oper: .substract)
        test = "Performing Substraction"
    }
    /// 4: Addition Operation
    /// - Parameter sender: should be  an instance of rounded button
    @IBAction func addOp(_ sender: RoundButton) {
        operationfunc(oper: .add)
        test = "Performing Addition"
    }
    /// 5: Equal To Button
    /// - Parameter sender: should be  an instance of rounded button
    @IBAction func equal(_ sender: RoundButton) {
        operationfunc(oper: operatorKey)
        test = "Equal Button"
    }
    // Dot button
    @IBAction func dot(_ sender: RoundButton) {
        dotTapped(button: sender)
        // connecting to the label
        if label.text != numberOnScreen {
            label.text = numberOnScreen
        }
    }
    /// appends numberOnScreen and checks if the last digit is not dot
    /// - Parameter button: should be  an instance of rounded button
    func dotTapped(button: RoundButton ) {
        if numberOnScreen.count <= 7 {
            numberOnScreen += "."
            }
    }
    /// Calls the performing math method to perform the operation
    /// - Parameter oper: OperatorKeys Enum
    func operationfunc(oper: OperatorKeys) {
        var left = 0.0
        var right = 0.0
        // First check if the operation is not null
        // bussiness rule
        if operatorKey != .NULL {
            // check if the numberOnScreen is not null
            if numberOnScreen != ""{
                rightValue = numberOnScreen
                numberOnScreen = ""
                // converts the numbers into double
                if let leftv = Double(leftValue) {
                    left = leftv
                }
                if let rightv = Double(rightValue) {
                    right = rightv
                }
                let opp = oper
                performingMath(left: left, right: right, opp: opp)
                // display result on the screen
                label.text = result
            }
            // storing the operation for further calculation
            operatorKey = oper
        } else {
            // for the first number
            leftValue = numberOnScreen
            numberOnScreen = ""
            operatorKey = oper
        }
    }
    /// Performs addition, substraction, multiplication, division
    /// - Parameters:
    ///   - left: left value
    ///   - right: right value
    ///   - opp: operator
    func performingMath(left: Double, right: Double, opp: OperatorKeys) {
        var res = 0.0
            switch opp {
            case .add : result = "\(left + right)"
            case .substract : result = "\(left - right)"
            case .multiply : result = "\(left * right)"
            case .divide : result = "\(left / right)"
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
