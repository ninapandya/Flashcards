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
    
    @IBOutlet weak var optionOneBtn: UIButton!
    @IBOutlet weak var optionTwoBtn: UIButton!
    @IBOutlet weak var optionThreeBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        card.layer.cornerRadius = 20.0
        card.layer.shadowRadius = 15.0
        card.layer.shadowOpacity = 0.2
        self.frontLabel.layer.cornerRadius = 20.0
        self.backLabel.layer.cornerRadius = 20.0
        frontLabel.clipsToBounds = true
        backLabel.clipsToBounds = true
        
        optionOneBtn.layer.borderWidth = 3.0
        optionOneBtn.layer.borderColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
        optionOneBtn.layer.cornerRadius = 20.0
        optionOneBtn.contentHorizontalAlignment = .center
        
        optionTwoBtn.layer.borderWidth = 3.0
        optionTwoBtn.layer.borderColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
        optionTwoBtn.layer.cornerRadius = 20.0
        optionTwoBtn.contentHorizontalAlignment = .center
        
        optionThreeBtn.layer.borderWidth = 3.0
        optionThreeBtn.layer.borderColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
        optionThreeBtn.layer.cornerRadius = 20.0
        optionThreeBtn.contentHorizontalAlignment = .center
        
    }

    @IBAction func didTapOnFlashcard(_ sender: Any) {
       if frontLabel.isHidden == true{
          frontLabel.isHidden = false
       } else {
          frontLabel.isHidden = true
       }
            
   }
    
    @IBAction func didTapOptionOne(_ sender: Any) {
        optionOneBtn.isHidden = true
    }
    
    
    @IBAction func didTapOptionTwo(_ sender: Any) {
        frontLabel.isHidden = true
    }
    
    @IBAction func didTapOptionThree(_ sender: Any) {
        optionThreeBtn.isHidden = true
    }
    
    func updateFlashcard(question: String, answer: String, extraAnswerOne: String?, extraAnswerTwo: String?) {
        frontLabel.text = question
        backLabel.text = answer
        
        optionOneBtn.setTitle(extraAnswerOne, for: .normal)
        optionTwoBtn.setTitle(answer, for: .normal)
        optionThreeBtn.setTitle(extraAnswerTwo, for: .normal)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navigationController = segue.destination as! UINavigationController
        
        let creationController = navigationController.topViewController as! CreationViewController
        
        creationController.flashcardsController = self
    }
}

