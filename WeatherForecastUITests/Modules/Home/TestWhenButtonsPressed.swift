//
//  TestWhenButtonsPressed.swift
//  WeatherForecastUITests
//
//  Created by Mohamed Elsayed on 07/09/2021.
//

import XCTest

class TestWhenButtonsPressed: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testwhenTodayButtonPressed() throws {
        let app = XCUIApplication()

        let todayButton = app.buttons["Today"]
        todayButton.tap()
        XCTAssertEqual(todayButton.label, "Today")
        
        let todayCollectionView = app.collectionViews
        XCTAssertNotEqual(todayCollectionView.cells.count, 0)
    }
    
    func testwhenNextWeekButtonPressed() throws {
        let app = XCUIApplication()
        
        let todayButton = app.buttons["NextWeek"]
        todayButton.tap()
        XCTAssertEqual(todayButton.label, "Next 7 Days")
        
        let todayCollectionView = app.collectionViews
        XCTAssertNotEqual(todayCollectionView.cells.count, 0)
    }
}
