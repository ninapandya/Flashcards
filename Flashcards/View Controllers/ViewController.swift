//
//  ViewController.swift
//  Flashcards
//
//  Created by Nina Pandya on 2/20/21.
//

import UIKit

struct Flashcard {
    var question: String
    var answer: String
    var extraAnswer1: String
    var extraAnswer2: String
    
}

class ViewController: UIViewController {
    
    @IBOutlet weak var card: UIView!
    @IBOutlet weak var backLabel: UILabel!
    @IBOutlet weak var frontLabel: UILabel!
    
    @IBOutlet weak var optionOneBtn: UIButton!
    @IBOutlet weak var optionTwoBtn: UIButton!
    @IBOutlet weak var optionThreeBtn: UIButton!
    
    @IBOutlet weak var prevButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    //Array to hold our flashcards
    var flashcards = [Flashcard]()
    
    //current flashcard index
    var currentIndex = 0
    
    
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
        
        if flashcards.count == 0 {
            updateFlashcard(question: "What is the capital of Hawaii?", answer: "Honolulu", extraAnswerOne: "Los Angeles", extraAnswerTwo: "New York City")
        } else {
            updateLabels()
            updateNextPrevButtons()
        }
        
        readSavedFlashcards()
        
        
        
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
    
    @IBAction func didTapOnNext(_ sender: Any) {
        //Increase current index
        currentIndex = currentIndex + 1
        
        //update Labels
        updateLabels()
        
        //update buttons
        updateNextPrevButtons()
    
    }
    
    @IBAction func didTapOnPrev(_ sender: Any) {
        //decrease current index
        currentIndex = currentIndex - 1
        
        updateLabels()
        
        updateNextPrevButtons()
        
    
    }
    
    func updateFlashcard(question: String, answer: String, extraAnswerOne: String?, extraAnswerTwo: String?) {
        let flashcard = Flashcard(question: question, answer: answer, extraAnswer1: extraAnswerOne!, extraAnswer2: extraAnswerTwo!)
        
        //Adding flashcard in the flashcards array
        flashcards.append(flashcard)
        
        //Logging to the console
        print(":) Added new flashcard")
        print("We now have \(flashcards.count) flashcards")
        
        currentIndex = flashcards.count - 1
        print("Out current index is \(currentIndex)")
        
        optionOneBtn.setTitle(extraAnswerOne, for: .normal)
        optionTwoBtn.setTitle(answer, for: .normal)
        optionThreeBtn.setTitle(extraAnswerTwo, for: .normal)
        
        //update buttons
        updateNextPrevButtons()
        
        //update labels
        updateLabels()
        
        saveAllFlashcardsToDisk()
        
        
    }
    
    func updateNextPrevButtons(){
        
        //Disable next button if at the end
        if currentIndex == flashcards.count - 1 {
            nextButton.isEnabled = false
            
        } else {
            nextButton.isEnabled = true
        }
        
        //Disable prev button if at the beginning
        if currentIndex == 0 {
            prevButton.isEnabled = false
            
        } else {
            prevButton.isEnabled = true
        }
        
    }
    
    func updateLabels() {
        
        //Get current flashcard
        let currentFlashcard = flashcards[currentIndex]
        
        //update labels
        frontLabel.text = currentFlashcard.question
        backLabel.text = currentFlashcard.answer
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navigationController = segue.destination as! UINavigationController
        
        let creationController = navigationController.topViewController as! CreationViewController
        
        creationController.flashcardsController = self
    }
    
    func saveAllFlashcardsToDisk() {
        let dictionaryArray = flashcards.map { (card) -> [String: String] in
            return ["question": card.question, "answer": card.answer, "extraAnswer1": card.extraAnswer1, "extraAnswer2": card.extraAnswer2]
        }
        //save array on disk using UserDefaults
        UserDefaults.standard.set(dictionaryArray, forKey: "flashcards")
        
        //log it
        print("Flashcards saved to UserDefaults")
        
    }
    
    func readSavedFlashcards() {
        
        //Read dictionary array from disk (if any)
        if let dictionaryArray = UserDefaults.standard.array(forKey: "flashcards") as? [[String: String]] {
            
            //in here we know for sure we have a dictionary array
            let savedCards = dictionaryArray.map { dictionary -> Flashcard in
                return Flashcard(question: dictionary["question"]!, answer: dictionary["answer"]!, extraAnswer1: dictionary["extraAnswer1"]!, extraAnswer2: dictionary["extraAnswer2"]!)
                
            }
            
            flashcards.append(contentsOf: savedCards)
        }
        
        
        
    }
}

