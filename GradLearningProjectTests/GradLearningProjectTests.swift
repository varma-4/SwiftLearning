//
//  GradLearningProjectTests.swift
//  GradLearningProjectTests
//
//  Created by Mani on 12/10/21.
//

import XCTest
@testable import GradLearningProject

class GradLearningProjectTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testCalculatorMinusOperatorLogic() {
        // TDD Test driven development
        // if your test never fails, then you are writing the wrong test.
        let viewController = ViewController()
        var buttons = [RoundButton]()
        for number in 0..<10 {
            let object = RoundButton()
            object.tag = number
            buttons.append(object)
        }
        XCTAssertTrue(buttons.count == 10)
        XCTAssertEqual(buttons.count, 10, "Button count should be ten")
        for number in 0...11 {
            let button = number > (buttons.count - 1) ? buttons[0] : buttons[number]
            viewController.numberTapped(button: button)
        }
        XCTAssertEqual(viewController.numberOnScreen.count, 9)
    }
    // logic
    // UI
    func testAddition() {
        let num1 = 10.0
        let num2 = 20.0
       let viewcontroller = ViewController()
        viewcontroller.method1(left: num1,right: num2, opp: .add)
        XCTAssertEqual(viewcontroller.result, "30")
    }
    func testSubstraction() {
        let num1 = 20.0
        let num2 = 10.0
       let viewcontroller = ViewController()
        viewcontroller.method1(left: num1, right: num2, opp: .substract)
        XCTAssertEqual(viewcontroller.result, "10")
    }
    func testMultiply() {
        let num1 = 10.0
        let num2 = 20.0
       let viewcontroller = ViewController()
        viewcontroller.method1(left: num1, right: num2, opp: .multiply)
        XCTAssertEqual(viewcontroller.result, "200")
    }
    func testDivision() {
        let num1 = 20.0
        let num2 = 10.0
       let viewcontroller = ViewController()
        viewcontroller.method1(left: num1, right: num2, opp: .divide)
        XCTAssertEqual(viewcontroller.result, "2")
    }
    func testOperationFunc() {
        let viewcontroller = ViewController()
        viewcontroller.operationfunc(oper: .add)
        XCTAssertEqual(viewcontroller.result, "")
    }
    func testDotButton() {
        let viewController = ViewController()
        var buttons = [RoundButton]()
        for number in 0..<8 {
            let object = RoundButton()
            object.tag = number
            buttons.append(object)
        }
        XCTAssertTrue(buttons.count == 8)
        XCTAssertEqual(buttons.count, 8, "Button count should be eight")
        for number in 0...7 {
            let button = number > (buttons.count - 1) ? buttons[0] : buttons[number]
            viewController.dotTapped(button: button)
        }
        XCTAssertEqual(viewController.numberOnScreen.count, 8)
        
    }
    func testAllClear() {
        let button = RoundButton()
        let viewcontroller = ViewController()
        viewcontroller.allClear(button)
        XCTAssertEqual(viewcontroller.numberOnScreen, "")
        XCTAssertEqual(viewcontroller.result, "")
    }
    func testDivOp() {
        let button = RoundButton()
        let viewcontroller = ViewController()
        viewcontroller.divOp(button)
        XCTAssertEqual(viewcontroller.test, "Performing Division")
    }
    func testMulOp() {
        let button = RoundButton()
        let viewcontroller = ViewController()
        viewcontroller.mulOp(button)
        XCTAssertEqual(viewcontroller.test, "Performing multiplication")
    }
    func testMinusOp() {
        let button = RoundButton()
        let viewcontroller = ViewController()
        viewcontroller.minusOp(button)
        XCTAssertEqual(viewcontroller.test, "Performing Substraction")
    }
    func testAddOp() {
        let button = RoundButton()
        let viewcontroller = ViewController()
        viewcontroller.addOp(button)
        XCTAssertEqual(viewcontroller.test, "Performing Addition")
    }
    func testmethod1() {
        let num1 = 10.0
        let num2 = 10.0
        let viewcontroller = ViewController()
         viewcontroller.method1(left: num1, right: num2, opp: .divide)
         XCTAssertEqual(viewcontroller.leftValue, "1.0")
    }
}
