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
    
    @IBAction func whenButtonPressed(_sender: UIBarButtonItem){
        let alert = UIAlertController(title: "Pull Item from TextField?", message: nil, preferredStyle: .alert)
        let yes = UIAlertAction(title: "Yes", style: .default, handler: textFieldHandler)
        alert.addAction(yes)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(alert, animated: true)
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

