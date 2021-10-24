//
//  GradLearningProjectTests.swift
//  GradLearningProjectTests
//
//  Created by Mani on 12/10/21.
//

import XCTest
@testable import GradLearningProject

class GradLearningProjectTests: XCTestCase {
    let viewController = ViewController()
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
        viewController.performingMath(left: num1, right: num2, opp: .add)
        XCTAssertEqual(viewController.result, "30")
        viewController.performingMath(left: num1, right: num2, opp: .substract)
        XCTAssertEqual(viewController.result, "-10")
        viewController.performingMath(left: num1, right: num2, opp: .multiply)
        XCTAssertEqual(viewController.result, "200")
        viewController.performingMath(left: num1, right: num2, opp: .divide)
        XCTAssertEqual(viewController.result, "0.5")
    }
    func testOperationFunc() {
        viewController.operationfunc(oper: .add)
        XCTAssertEqual(viewController.result, "")
    }
    func testDotButton() {
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
        viewController.allClearData()
        XCTAssertEqual(viewController.numberOnScreen, "")
        XCTAssertEqual(viewController.result, "")
    }
    func testDivOp() {
        let button = RoundButton()
        viewController.divOp(button)
        XCTAssertEqual(viewController.test, "Performing Division")
        viewController.mulOp(button)
        XCTAssertEqual(viewController.test, "Performing multiplication")
        viewController.minusOp(button)
        XCTAssertEqual(viewController.test, "Performing Substraction")
        viewController.addOp(button)
        XCTAssertEqual(viewController.test, "Performing Addition")
        viewController.equal(button)
        XCTAssertEqual(viewController.test, "Equal Button")
    }
    func testmethod1() {
        let num1 = 10.0
        let num2 = 10.0
         viewController.performingMath(left: num1, right: num2, opp: .divide)
         XCTAssertEqual(viewController.leftValue, "1.0")
    }
    func testOperationFuncElse() {
        viewController.leftValue = "20"
        viewController.rightValue = "20"
        viewController.operatorKey = .add
        viewController.numberOnScreen = "20"
        viewController.operationfunc(oper: .add)
        XCTAssertEqual(viewController.result, "40")
        viewController.operationfunc(oper: .NULL)
        XCTAssertEqual(viewController.numberOnScreen, "")
    }
}
