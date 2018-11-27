//
//  TableViewController.swift
//  Detailed
//
//  Created by Benjamin Hakes on 11/27/18.
//  Copyright © 2018 Benjamin Hakes. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return Model.shared.characters.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let reuseIdentifier = "cell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? TableViewCell else {fatalError("unable to dequeEntryCell")}
        // Configure the cell...
        
        let character = Model.shared.characters[indexPath.row]
        cell.imageViewInCell?.image = Model.shared.image(for: character)

        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else {return}
        guard let destination = segue.destination as? DetailedViewController else {return}
        
        let character = Model.shared.characters[indexPath.row]
        
        destination.character = character
    }

}
