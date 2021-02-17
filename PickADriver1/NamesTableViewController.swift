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
        tableView.isEditing = true
    }

    @IBAction func onAddNameTapped(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Add a name", message: nil, preferredStyle: .alert)
        var nameField: UITextField?
        alert.addTextField(configurationHandler: {(textField) in
            nameField = textField
            nameField?.placeholder = "Name"
        })
        let cancelAction = UIAlertAction(title: "Cance;", style: .cancel, handler: nil)
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
    

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
         //    Delete the row from the data source
            names.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    

    
     //Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let nameToMove = names.remove(at: fromIndexPath.row)
        names.insert(nameToMove, at: to.row)
    }
    

    
     ///Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     //    Return false if you do not want the item to be re-orderable.
        return true
    }
    



}
