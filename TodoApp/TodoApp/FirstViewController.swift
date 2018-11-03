//
//  FirstViewController.swift
//  TodoApp
//
//  Created by jack on 10/21/18.
//  Copyright © 2018 jack. All rights reserved.
//

import UIKit
var list = [String]()	;
var completed = [String]()
let defaults = UserDefaults.standard
class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var TodoViewControl: UITableView!
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        	return(list.count)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let TodoList = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "TodoList")
        TodoList.textLabel?.text = list[indexPath.row]
        return(TodoList)
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool{
        return true
    }
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let editButton = UITableViewRowAction(style: .normal, title: "Edit", handler: { (action, indexPath) in
            let alert = UIAlertController(title: "", message: "Edit", preferredStyle: .alert)
            alert.addTextField(configurationHandler: { (textField) in
                	textField.text = list[indexPath.row]
            })
            alert.addAction(UIAlertAction(title: "Edit", style: .default, handler: { (updateAction) in
                list[indexPath.row] = alert.textFields!.first!.text!
                self.TodoViewControl.reloadRows(at: [indexPath], with: .fade)
            }))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            self.present(alert, animated: true)
        })
        editButton.backgroundColor = UIColor.yellow
        
        let completeButton = UITableViewRowAction(style: .normal, title: "Completed") { (rowAction, IndexPath) in
            completed.append(list[indexPath.row]);
            list.remove(at: indexPath.row)
            self.TodoViewControl.reloadData()
        }
        completeButton.backgroundColor = UIColor.green
        return[editButton, completeButton]
    }
    
    @IBOutlet weak var TodoText: UITextField!
    
    @IBAction func TodoButton(_ sender: Any) {
        if TodoText.text != ""{
	        list.append(TodoText.text!)
            TodoText.text = ""
            TodoViewControl.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        // Do any additional setup after loading the view, typically from a nib.
    }


}

