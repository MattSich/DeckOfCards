//
//  CardPickerViewController.swift
//  DeckOfCards
//
//  Created by Matthew Sich on 7/11/17.
//  Copyright © 2017 Matthew Sich. All rights reserved.
//

import Foundation
import UIKit

class CardPickerViewController:UIViewController{
    
    let model = CardPickerModel()
    
    @IBOutlet weak var numberOfCards: UILabel!
    @IBOutlet weak var cardPreview: UIImageView!
    @IBOutlet weak var cardContainer: UIView!
    @IBOutlet weak var shuffleButton: UIButton!
    @IBOutlet weak var dealButton: UIButton!
    @IBOutlet weak var resetDeckButton: UIButton!
    
    @IBOutlet weak var shuffleTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var resetBottomConstraint: NSLayoutConstraint!
    
    var defaultResetBottom:CGFloat!
    var defaultShuffleTop:CGFloat!
    
    @IBAction func shuffle(_ sender: UIButton) {
        model.shuffle()
    }
    @IBAction func deal(_ sender: UIButton) {
        if cardContainer.alpha == 0 {
            UIView.animate(withDuration: 0.3, animations: { 
                self.cardContainer.alpha = 1
            })
        }
        let card = model.deal()
        guard let nonNilCard = card, let cardImage = nonNilCard.image() else {
            print("Could not find the card image")
            return
        }
        
        cardPreview.image = cardImage
    }
    @IBAction func resetDeck(_ sender: UIButton) {
        model.reset()
        UIView.animate(withDuration: 0.3, animations: {
            self.cardContainer.alpha = 0
        })
    }
    
    // Mark - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cardContainer.alpha = 0
        
        defaultResetBottom = resetBottomConstraint.constant
        defaultShuffleTop = shuffleTopConstraint.constant
        
        toggleResetButton(show:false, duration: 0)
        
        cleanUI()
        
        model.hideReset = { [unowned self] shouldHide in
            self.toggleResetButton(show: !shouldHide)
        }
        
        model.updateCardCount = { [unowned self] newCardCount in
            self.numberOfCards.text = "\(newCardCount)"
        }
        
        model.outOfCards = { [unowned self] in
            let alertController = UIAlertController(title: "Out of cards", message: "You can reset the deck to deal again", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(OKAction)
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    // Mark - Private
    
    fileprivate func cleanUI(){
        shuffleButton.layer.cornerRadius = 5
        
        dealButton.layer.cornerRadius = 5
        dealButton.layer.borderColor = UIColor(white: 0.8, alpha: 1.0).cgColor
        dealButton.layer.borderWidth = 1
        
        cardContainer.backgroundColor = .white
        cardContainer.layer.cornerRadius = 15
        cardContainer.layer.shadowColor = UIColor.black.cgColor
        cardContainer.layer.shadowRadius = 10
        cardContainer.layer.shadowOpacity = 0.1
    }
    
    fileprivate func toggleResetButton(show:Bool = true, duration:TimeInterval = 0.3) {
        let resetDeckHeight = resetDeckButton.frame.size.height
        resetBottomConstraint.constant = show ? defaultResetBottom : -resetDeckHeight
        shuffleTopConstraint.constant = show ? defaultShuffleTop : defaultShuffleTop + resetDeckHeight
    
        UIView.animate(withDuration: duration) {
            self.view.layoutIfNeeded()
        }
    }
    
}
