//
//  ViewController.swift
//  TaskKit
//
//  Created by Harsh Singh on 04/02/26.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var taskTable: UITableView!
    private var addTask: UIBarButtonItem!
    let taskViewModel = TaskListViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationController()
        setupTableView()
        taskViewModel.onTasksUpdated = { [weak self] in
            self?.taskTable.reloadData()
        }
    }
    
    
    private func setupNavigationController() {
        addTask =  UIBarButtonItem(title: "Add Task", style: .prominent, target: self, action: #selector(addTaskTapped))
        navigationItem.rightBarButtonItem = addTask
    }
    
    private func setupTableView() {
        taskTable.register(UINib(nibName: "TaskCell", bundle: nil), forCellReuseIdentifier: "TaskCell")
        taskTable.delegate = self
        taskTable.dataSource = self
    }
    
    @objc private func addTaskTapped() {
        let vc = AddTaskController()
        vc.taskViewModel = taskViewModel
        
        if let sheet = vc.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
            sheet.prefersGrabberVisible = true
            sheet.preferredCornerRadius = 20
        }
        
        self.present(vc, animated: true) {
            self.taskTable.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        taskViewModel.tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath) as? TaskCell else {
            return UITableViewCell()
        }
        let tasks = taskViewModel.tasks[indexPath.row]
        cell.titleLabel.text = tasks.title
        cell.descriptionLabel.text = tasks.description
        cell.switchView.isOn = tasks.isCompleted
        return cell
    }

}

