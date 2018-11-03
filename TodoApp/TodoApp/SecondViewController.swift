//
//  SecondViewController.swift
//  TodoApp
//
//  Created by jack on 10/21/18.
//  Copyright © 2018 jack. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var CompletedList: UITableView!
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return(completed.count)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let CompletedTask = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "CompletedTask")
        CompletedTask.textLabel?.text = completed[indexPath.row]
        return(CompletedTask)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle,forRowAt indexPath: IndexPath){
        if editingStyle == UITableViewCell.EditingStyle.delete{
            completed.remove(at: indexPath.row)
            CompletedList.reloadData()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        CompletedList.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

