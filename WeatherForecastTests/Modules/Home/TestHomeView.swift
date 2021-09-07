//
//  TestHomeView.swift
//  WeatherForecastTests
//
//  Created by Mohamed Elsayed on 06/09/2021.
//

import XCTest
@testable import WeatherForecast

class TestHomeView: XCTestCase {
    
    private var homeVC: HomeView = HomeRouter.start().view!

    override func setUpWithError() throws {
        try? super.setUpWithError()
        
    }
    
    func testPresenter() {
        XCTAssert(homeVC.presenter != nil, "Not nil")
    }

    override func tearDownWithError() throws {
        try? super.tearDownWithError()
    }
    
}
