//
//  CardItem.swift
//  Concenration
//
//  Created by Admin on 23.10.2023.
//

import Foundation

enum CardError: Error {
    case matchedYetError(firstCard: CardItem, secondCard: CardItem)
}

class CardItem {
    var isMatched = false
    var isHidden = true
    var value = ""
    
    init(value: String) {
        self.value = value
    }

    func changeCardState(with card: CardItem) {
        do {
            let isMatched = try isCardsMatched(with: card)
            if isMatched {
                self.isMatched = true
                card.isMatched = true
                isHidden = false
                card.isHidden = false
            } else {
                isHidden = true
                card.isHidden = true
            }
        } catch {
            
        }
        
    }
    
    func isCardsMatched(with card: CardItem) throws -> Bool {
        guard !isMatched else {
            throw CardError.matchedYetError(firstCard: self, secondCard: card)
        }
        return value == card.value
    }
    
    
}
