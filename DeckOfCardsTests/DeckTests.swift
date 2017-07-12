//
//  DeckTests.swift
//  DeckOfCards
//
//  Created by Matthew Sich on 7/11/17.
//  Copyright © 2017 Matthew Sich. All rights reserved.
//

import XCTest
@testable import DeckOfCards

class DeckTests:XCTestCase {
    
    let cardsInADeck = 52
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testDefaultDeck() {
        let deck = Deck()
        XCTAssertEqual(deck.cards.count, cardsInADeck, "There are 52 cards")
        
    }
    
    func testShuffledDeck() {
        let deck = Deck()
        
        // Simple way to test randomness is to see if the first card changes.
        // The chance that the first card stays the same after two suffles is small enough to disregard
        
        guard let unShuffledFirstCard = deck.cards.first else {
            XCTFail("Could not get the first card from the deck")
            return
        }
        deck.shuffle()
        guard let firstShuffleCard = deck.cards.first else {
            XCTFail("Could not get the first card from the deck")
            return
        }
        deck.shuffle()
        guard let secondShuffleCard = deck.cards.first else {
            XCTFail("Could not get the first card from the deck")
            return
        }
        
        if unShuffledFirstCard == firstShuffleCard && unShuffledFirstCard == secondShuffleCard {
            XCTFail("Deck is not being properly shuffled")
        }
        
    }
    
    func testDealCard(){
        let deck = Deck()
        guard let card = deck.dealOneCard() else {
            XCTFail("No cards in deck")
            return
        }
        XCTAssertTrue(card.cardType == .king, "The top card in an unshuffeld deck should be a king")
        XCTAssertTrue(card.cardFace == .spade, "The top card in an unshuffeld deck should be a spade")
        XCTAssertEqual(deck.cards.count, cardsInADeck - 1, "Dealing a card should result in one less card in the deck")
    }
    
    func testLastCard(){
        let deck = Deck()
        for _ in 0 ..< 52 {
            XCTAssertNotNil(deck.dealOneCard(), "Card was nil before deck was empty")
        }
        XCTAssertNil(deck.dealOneCard(), "No last card")
    }
    
    func testShuffleEmptyDeck(){
        let deck = Deck()
        for _ in 0 ..< 52 {
            XCTAssertNotNil(deck.dealOneCard(), "Card was nil before deck was empty")
        }
        deck.shuffle()
    }
}
