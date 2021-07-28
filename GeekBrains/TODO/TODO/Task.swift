//
//  Task.swift
//  TODO
//
//  Created by Marcus on 28.07.2021.
//

import Foundation

protocol TaskProtocol {
    var name: String {get set}
    
}

struct Task: TaskProtocol {
    var name: String
    var subTasks: [TaskProtocol]
}

struct Subtask: TaskProtocol {
    var name: String
    
}
