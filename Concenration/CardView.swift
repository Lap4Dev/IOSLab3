//
//  CardView.swift
//  Concenration
//
//  Created by Admin on 23.10.2023.
//

import UIKit

protocol CardViewDelegate: AnyObject {
    func selected(sender: CardItem)
    func unSelect(sender: CardItem)
}

class CardView: NibLoadingView {

    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var topView: UIView!
    
    weak var delegate: CardViewDelegate?
    
    private var cardItem: CardItem!
    
    func configure(cardItem: CardItem) {
        self.cardItem = cardItem
        valueLabel.text = cardItem.value
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        if topView.isHidden {
            delegate?.selected(sender: cardItem)
            bottomView.flip(to: topView, animationOption: .transitionFlipFromLeft)
        } else {
            delegate?.unSelect(sender: cardItem)
            topView.flip(to: bottomView, animationOption: .transitionFlipFromRight)
        }
    }
}

extension UIView {
    
    func flip(to: UIView, animationOption: UIView.AnimationOptions) {
        UIView.transition(from: self, to: to, duration: 0.5, options: [animationOption, .showHideTransitionViews], completion: nil)
    }
}
