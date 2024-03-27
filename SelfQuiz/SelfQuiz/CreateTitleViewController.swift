
//
//  CreateTitleViewController.swift
//  SelfQuiz
//
//  Created by Karl Macayan on 2024-03-26.
//



import UIKit
import CoreData

class CreateTitleViewController: UIViewController {

    @IBOutlet weak var courseNameField: UITextField!
    @IBOutlet weak var quizTitleField: UITextField!

    // Reference to the Core Data managed object context
    lazy var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "save" {
            if let editQuizVC = segue.destination as? EditQuizViewController {
                // Pass the entered data to EditQuizViewController
                editQuizVC.courseName = courseNameField.text
                editQuizVC.quizTitleText = quizTitleField.text
            }
        }
    }

    @IBAction func saveTitle(_ sender: UIButton) {
        guard let courseName = courseNameField.text, !courseName.isEmpty,
              let quizTitle = quizTitleField.text, !quizTitle.isEmpty else {
            // Handle case where one or both fields are empty
            print("Both course name and quiz title must be filled.")
            return
        }

        // Creates the corse name and quiz title for the next screen
        let newQuiz = Information(context: context)
        newQuiz.course = courseName
        newQuiz.quiz = quizTitle

        // Save the context to persist the changes
        do {
            try context.save()
            print("Data saved successfully!")
        } catch {
            print("Error saving data: \(error)")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Title"
    }
}

