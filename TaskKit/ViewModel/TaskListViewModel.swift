//
//  TaskListViewModel.swift
//  TaskKit
//
//  Created by Harsh Singh on 04/02/26.
//

import Foundation

class TaskListViewModel {

    private(set) var tasks: [Task] = []

    var onTasksUpdated: (() -> Void)?

    func addTask(title: String, description: String) {
        let task = Task(id: UUID(), title: title, description:description, isCompleted: false)
        tasks.append(task)
        onTasksUpdated?()
    }

    func toggleTask(at index: Int) {
        tasks[index].isCompleted.toggle()
        onTasksUpdated?()
    }

    func deleteTask(at index: Int) {
        tasks.remove(at: index)
        onTasksUpdated?()
    }

    func taskViewModel(at index: Int) -> TaskViewModel {
        TaskViewModel(task: tasks[index])
    }
}
