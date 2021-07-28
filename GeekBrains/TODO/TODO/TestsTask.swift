//
//  TestsTask.swift
//  TODO
//
//  Created by Marcus on 28.07.2021.
//

import Foundation

class TestTasks {
    static func createTestsTasks()-> [Task] {
        var tasks: [Task] = []
        let subtask111 = Subtask(name: "Task111")
        let task11 = Task(name: "Task11", subTasks: [subtask111])
        let task12 = Subtask(name: "Task12")
        let task1 = Task(name: "Task1", subTasks: [task11, task12])
        tasks.append(task1)
        
        let task21 = Subtask(name: "Task21")
        let task2 = Task(name: "Task2", subTasks: [task21])
        tasks.append(task2)
        
        let task311 = Subtask(name: "Task311")
        let task312 = Subtask(name: "Task312")
        let task31 = Task(name: "Task31", subTasks: [task311, task312])
        let task3 = Task(name: "Task3", subTasks: [task31])
        tasks.append(task3)
            return tasks
    }
}
