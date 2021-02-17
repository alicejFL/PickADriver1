//
//  NamesTableViewController.swift
//  PickADriver1
//
//  Created by James, Alice - PGA on 2/17/21.
//

import UIKit

class NamesTableViewController: UITableViewController {
var names = ["Kelly", "Scott", "Heather", "Hilary", "Kris", "Chef", "DJ", "Ryan", "John", "Noah", "Tim", "Brooks"]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NameCell", for: indexPath)

        cell.textLabel?.text = names[indexPath.row]

        return cell
    }
    

    @IBAction func onAddNameTapped(_ sender: Any)
    {
        let alert = UIAlertController(title: "Add a name", message: nil, preferredStyle: .alert)
        var nameField: UITextField?
        alert.addTextField(configurationHandler: {(textField) in
            nameField = textField
            nameField?.placeholder = "Name"
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        let confirmAction = UIAlertAction(title: "OK", style: .default, handler: {(action) in
            if let name = nameField?.text {
                self.names.append(name)
                self.tableView.reloadData()
            }
        })
        alert.addAction(confirmAction)
        present(alert, animated: true, completion: nil)
    }
    
}
