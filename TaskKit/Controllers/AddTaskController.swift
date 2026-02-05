//
//  AddTaskController.swift
//  TaskKit
//
//  Created by Harsh Singh on 04/02/26.
//

import UIKit

class AddTaskController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var descriptionField: UITextField!
    @IBOutlet weak var addTask: UIButton!
    var taskViewModel = TaskListViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUIElements()
    }
    
    private func setupUIElements() {
        titleField.borderStyle = .roundedRect
        titleField.layer.borderColor = UIColor.accent.cgColor
        titleField.layer.borderWidth = 1.0
        titleField.layer.cornerRadius = 12.0
        descriptionField.layer.cornerRadius = 12.0
        descriptionField.borderStyle = .roundedRect
        descriptionField.layer.borderColor = UIColor.accent.cgColor
        descriptionField.layer.borderWidth = 1.0
        
        addTask.layer.cornerRadius = 8.0
        addTask.addTarget(self, action: #selector(addTaskTapped), for: .touchUpInside)
    }
    
    @objc
    private func addTaskTapped() {
        guard let title = titleField.text, !title.isEmpty else {
            showAlert(title: "Error", message: "Please enter a title for the task.")
            return
        }
        
        guard let description = descriptionField.text, !description.isEmpty else {
            showAlert(title: "Error", message: "Please enter a description for the task.")
            return
        }
        
        taskViewModel.addTask(title: title, description: description)
        self.dismiss(animated: true)
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }

}
