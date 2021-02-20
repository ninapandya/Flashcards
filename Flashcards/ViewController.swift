//
//  ViewController.swift
//  Flashcards
//
//  Created by Nina Pandya on 2/20/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var card: UIView!
    @IBOutlet weak var backLabel: UILabel!
    @IBOutlet weak var frontLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        card.layer.cornerRadius = 20.0
        card.clipsToBounds = true
    }

    @IBAction func didTapOnFlashcard(_ sender: Any) {
        if frontLabel.isHidden == true{
            frontLabel.isHidden = false
        } else {
            frontLabel.isHidden = true
        }
            
    }
    
}

