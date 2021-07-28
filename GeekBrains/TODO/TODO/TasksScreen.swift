//
//  TasksScreen.swift
//  TODO
//
//  Created by Marcus on 28.07.2021.
//

import Foundation
import UIKit

class TasksScreen: UITableViewController {
    
    var tasks: [TaskProtocol] = []
    var name: String = ""
    override func viewDidLoad() {
        view.backgroundColor = .white
        navigationItem.title = name
        navigationItem.setRightBarButtonItems([createRightBarButton()], animated: true)
    }
   
    private func createRightBarButton()-> UIBarButtonItem {
        let btn = UIBarButtonItem(systemItem: .add)
        return btn
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        cell.textLabel?.text = tasks[indexPath.row].name
        if let task = tasks[indexPath.row] as? Task {
            cell.detailTextLabel?.text = "Count of subtasks: " + String(task.subTasks.count)
        }
        return cell
    }
    
    private func nextScreen(name: String, subtasks: [TaskProtocol]) {
        let screen = TasksScreen()
        screen.tasks = subtasks
        screen.name = name
        navigationController?.pushViewController(screen, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let primaryTask = tasks[indexPath.row] as? Task else {
            return
        }
        nextScreen(name: primaryTask.name, subtasks: primaryTask.subTasks)
    }
}
