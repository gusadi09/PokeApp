//
//  PokeAppUITests.swift
//  PokeAppUITests
//
//  Created by Gus Adi on 02/04/24.
//

import XCTest
@testable import PokeApp

final class PokeAppUITests: XCTestCase {
    
    let app = XCUIApplication()

    override func setUpWithError() throws {
        continueAfterFailure = false

    }

    override func tearDownWithError() throws {
        app.terminate()
    }

    func test_googleButtonShowAlert() throws {
        app.launch()

        app.buttons.matching(identifier: "google_button")
            .firstMatch.tap()
        
        let alertMonitor = addUIInterruptionMonitor(withDescription: "Google Alert") { (alertElement) -> Bool in
            XCTAssertTrue(alertElement.buttons["Continue"].exists)
            
            return true
        }
        
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
