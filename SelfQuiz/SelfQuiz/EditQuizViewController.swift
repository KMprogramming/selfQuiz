//
//  EditQuizViewController.swift
//  SelfQuiz
//
//  Created by Karl Macayan on 2024-03-26.
//

import UIKit
import CoreData

class EditQuizViewController: UIViewController {
    
    @IBOutlet weak var questField: UITextView!
    @IBOutlet weak var option1: UITextField!
    @IBOutlet weak var option2: UITextField!
    @IBOutlet weak var option3: UITextField!
    @IBOutlet weak var option4: UITextField!
    
    // Reference to the Core Data managed object context
    lazy var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    @IBOutlet weak var courseN: UILabel!
    
    
    @IBOutlet weak var quizTitle: UILabel!
    
    
    // Properties to hold the course name and quiz title
      var courseName: String?
      var quizTitleText: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set course name and quiz title labels
        courseN.text = courseName
        quizTitle.text = quizTitleText
    }


    @IBAction func setCorrect1(_ sender: Any) {
        print("Option 1 was set as the correct answer.")
    }
    
    @IBAction func setCorrect2(_ sender: Any) {
        print("Option 2 was set as the correct answer.")
    }
    
    @IBAction func setCorrect3(_ sender: Any) {
        print("Option 3 was set as the correct answer.")
    }
    
    @IBAction func setCorrect4(_ sender: Any) {
        print("Option 4 was set as the correct answer.")
    }
    
    @IBAction func AddQuestion(_ sender: Any) {
        guard let questionText = questField.text,
              let option1Text = option1.text,
              let option2Text = option2.text,
              let option3Text = option3.text,
              let option4Text = option4.text,
              !questionText.isEmpty && !option1Text.isEmpty && !option2Text.isEmpty && !option3Text.isEmpty && !option4Text.isEmpty else {
            // Handle case where any of the fields are empty
            print("All fields must be filled.")
            return
        }

        // Create a new Core Data object
        let newQuestion = Edit(context: context)
        newQuestion.question = questionText
        newQuestion.option1 = option1Text
        newQuestion.option2 = option2Text
        newQuestion.option3 = option3Text
        newQuestion.option4 = option4Text

        // Save the context to persist the changes
        do {
            try context.save()
            print("Question was added!")
            clearTextFields() // Clear text fields after saving
        } catch {
            print("Error saving question: \(error)")
        }
    }

    private func clearTextFields() {
        questField.text = ""
        option1.text = ""
        option2.text = ""
        option3.text = ""
        option4.text = ""
    }
}

