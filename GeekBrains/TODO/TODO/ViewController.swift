//
//  ViewController.swift
//  TODO
//
//  Created by Marcus on 28.07.2021.
//

import UIKit

class ViewController: UITableViewController {
    private let testTasks = TestTasks.createTestsTasks()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Tasks"
        navigationItem.setRightBarButtonItems([createRightBarButton()], animated: true)
        
    }
    
    private func createRightBarButton()-> UIBarButtonItem {
        let btn = UIBarButtonItem(systemItem: .add)
        return btn
    }
    private func nextScreen(name: String, subtasks: [TaskProtocol]) {
        let screen = TasksScreen()
        screen.tasks = subtasks
        screen.name = name
        navigationController?.pushViewController(screen, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        nextScreen(name: testTasks[indexPath.row].name, subtasks: testTasks[indexPath.row].subTasks)
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        cell.textLabel?.text = testTasks[indexPath.row].name
        cell.detailTextLabel?.text = "Count of subtasks: " + String(testTasks[indexPath.row].subTasks.count)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return testTasks.count
    }
    
    
    
}

