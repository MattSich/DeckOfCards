//
//  CardPickerModel.swift
//  DeckOfCards
//
//  Created by Matthew Sich on 7/11/17.
//  Copyright © 2017 Matthew Sich. All rights reserved.
//

import Foundation

class CardPickerModel{
    let deck:Deck!
    
    var updateCardCount:((Int) -> Void)?
    var hideReset:((Bool) -> Void)?
    var outOfCards:(() -> Void)?
    
    init(){
        deck = Deck()
    }
    
    public func shuffle(){
        deck.shuffle()
        hideReset?(false)
    }
    
    public func deal() -> Card? {
        let newCard = deck.dealOneCard()
        if let nonNilCard = newCard {
            updateCardCount?(deck.cards.count)
            hideReset?(false)
            return nonNilCard
        } else {
            outOfCards?()
            return nil
        }
    }
    
    public func reset(){
        deck.resetDeck()
        updateCardCount?(deck.cards.count)
        hideReset?(true)
    }
    
}
