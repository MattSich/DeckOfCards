//
//  Card.swift
//  DeckOfCards
//
//  Created by Matthew Sich on 7/11/17.
//  Copyright © 2017 Matthew Sich. All rights reserved.
//

// Card Images from : https://github.com/hayeah/playing-cards-assets

import Foundation
import UIKit

class Card{
    var cardType:CardType!
    var cardFace:CardFace!
    
    init(cardType: CardType, cardFace: CardFace) {
        self.cardType = cardType
        self.cardFace = cardFace
    }
    
    // Mark - Public
    public func image() -> UIImage?{
        guard let type = cardType, let face = cardFace else {
            return nil
        }
        return UIImage(named: "\(type.rawValue)_of_\(face.rawValue)")
    }
}

extension Card: Equatable {
    static func ==(first: Card, second: Card) -> Bool {
        return first.cardFace == second.cardFace && first.cardType == second.cardType
    }
    static func !=(first: Card, second: Card) -> Bool {
        return first.cardFace != second.cardFace || first.cardType != second.cardType
    }
}
