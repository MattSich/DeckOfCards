//
//  Deck.swift
//  DeckOfCards
//
//  Created by Matthew Sich on 7/11/17.
//  Copyright © 2017 Matthew Sich. All rights reserved.
//

import Foundation


enum CardFace:String {
    case diamond = "diamonds"
    case heart = "hearts"
    case club = "clubs"
    case spade = "spades"
}

enum CardType:String {
    case ace = "ace"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case ten = "10"
    case jack = "jack"
    case queen = "queen"
    case king = "king"
}

let cardTypes:[CardType] = [.ace, .two, .three, .four, .five, .six, .seven, .eight, .nine, .ten, .jack, .queen, .king]
let cardFaces:[CardFace] = [.diamond, .heart, .club, .spade]

class Deck{
    public var cards:[Card]!
    
    init(){
        resetDeck()
    }
    
    // Mark - Public
    
    public func shuffle(){
        var shuffled:[Card] = []
        while cards.count > 0 {
            let randomNumberInCardsRange:Int = Int(arc4random_uniform(UInt32(cards.count)))
            let randomlySelectedCard = cards.remove(at: randomNumberInCardsRange)
            shuffled.append(randomlySelectedCard)
        }
        cards = shuffled
    }
    
    @discardableResult public func dealOneCard() -> Card?{
        if !cards.isEmpty {
            return cards.removeLast()
        }
        return nil
    }
    
    public func resetDeck(){
        cards = []
        
        for face in cardFaces {
            for type in cardTypes {
                cards.append(Card(cardType: type, cardFace: face))
            }
        }
    }
}




