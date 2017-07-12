//
//  CardTests.swift
//  DeckOfCards
//
//  Created by Matthew Sich on 7/11/17.
//  Copyright © 2017 Matthew Sich. All rights reserved.
//

import XCTest
@testable import DeckOfCards

class CardTests:XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testEquivalenceOverload() {
        let cardA = Card(cardType: .ace, cardFace: .club)
        let cardB = Card(cardType: .ace, cardFace: .club)
        let cardC = Card(cardType: .jack, cardFace: .heart)
        let cardD = Card(cardType: .eight, cardFace: .club)
        let cardE = Card(cardType: .ace, cardFace: .heart)
        
        XCTAssert(cardA == cardB, "Cards with the same face and type are equal")
        XCTAssertFalse(cardA == cardC, "Cards with different face and type are not equal")
        XCTAssertFalse(cardA == cardD, "Cards with different face are not equal")
        XCTAssertFalse(cardA == cardE, "Cards with different type are not equal")
        
        XCTAssertFalse(cardA != cardB, "Cards with the same face and type are equal")
        XCTAssert(cardA != cardC, "Cards with different face and type are not equal")
        XCTAssert(cardA != cardD, "Cards with different face are not equal")
        XCTAssert(cardA != cardE, "Cards with different type are not equal")
    }
    
}
