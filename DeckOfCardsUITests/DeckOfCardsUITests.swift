//
//  DeckOfCardsUITests.swift
//  DeckOfCardsUITests
//
//  Created by Matthew Sich on 7/11/17.
//  Copyright © 2017 Matthew Sich. All rights reserved.
//

import XCTest

class DeckOfCardsUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testDealAndReset(){
        
        let app = XCUIApplication()
        app.buttons["Deal"].tap()
        app.buttons["reset deck"].tap()
        
    }
    
    func testShuffleAndReset(){
        
        let app = XCUIApplication()
        app.buttons["Shuffle"].tap()
        app.buttons["reset deck"].tap()
        
    }
}
