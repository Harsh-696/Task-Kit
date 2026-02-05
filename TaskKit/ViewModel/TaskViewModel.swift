//
//  TaskViewModel.swift
//  TaskKit
//
//  Created by Harsh Singh on 04/02/26.
//

import Foundation

struct TaskViewModel {
    private var task: Task

    init(task: Task) {
        self.task = task
    }

    var titleText: String {
        task.title
    }

    var titleDescription: String {
        task.description
    }
    
    var isDone: Bool {
        task.isCompleted
    }
}
