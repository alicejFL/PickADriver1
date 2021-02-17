//
//  PeriodTableViewController.swift
//  PickADriver1
//
//  Created by James, Alice - PGA on 2/17/21.
//

import UIKit

class PeriodTableViewController: UITableViewController {
    var names = [["Scott", "Heather", "Hilary", "Kris", "Chef", "DJ", "Ryan", "John", "Noah", "Tim", "Brooks"], ["Kelly", "Scott", "Heather", "Hilary", "Kris", "Chef", "DJ", "Ryan", "John", "Noah", "Tim", "Brooks"], ["Heather", "Hilary", "Kris", "Chef", "DJ", "Ryan", "John", "Noah", "Tim", "Brooks"], ["Hilary", "Kris", "Chef", "DJ", "Ryan", "John", "Noah", "Tim", "Brooks"], ["Kris", "Chef", "DJ", "Ryan", "John", "Noah", "Tim", "Brooks"], ["Chef", "DJ", "Ryan", "John", "Noah", "Tim", "Brooks"], ["Kelly", "Scott", "Heather", "Hilary", "Kris", "Chef"], ["Alice", "Ryan", "Delia", "JP"]]
    var selectedNames: [String] = []
    var selectedPeriod = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedNames = names[indexPath.row]
        selectedPeriod = indexPath.row + 1
        performSegue(withIdentifier: "PeriodToNames", sender: nil)
    }
   
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let namesTableVC = segue.destination as? NamesTableViewController {
            namesTableVC.names = selectedNames
            namesTableVC.period = selectedPeriod
        }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
