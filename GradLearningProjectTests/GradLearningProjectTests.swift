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

}
