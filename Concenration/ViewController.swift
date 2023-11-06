//
//  ViewController.swift
//  Concenration
//
//  Created by Admin on 09.10.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private var cards: [CardView]!
    private var previousCard: CardItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}


extension ViewController:CardViewDelegate {
    func selected(sender: CardItem) {
        guard let previousCard = previousCard else {
            return
        }
    }
    
    func unSelect(sender: CardItem) {
        
    }
}


