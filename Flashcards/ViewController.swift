//
//  ViewController.swift
//  Flashcards
//
//  Created by Nina Pandya on 2/20/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var backLabel: UILabel!
    @IBOutlet weak var frontLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func didTapOnFlashcard(_ sender: Any) {
        backLabel.isHidden = true;
    }
    
}
