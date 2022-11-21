//
//  ViewController.swift
//  GitHubPractice3
//
//  Created by Amanda Reyes on 11/17/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textField: UITextField!
    
    var array : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
    }
    
    
    func textFieldHandler(_ : UIAlertAction) {
        if let text = textField.text {
            array.append(text)
            tableView.reloadData()
        }
        textField.text = ""
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = array[indexPath.row]
        cell.contentConfiguration = content
        return cell
    }

}

