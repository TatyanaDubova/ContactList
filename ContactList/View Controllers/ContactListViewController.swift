//
//  ContactListTableViewController.swift
//  ContactList
//
//  Created by Татьяна Дубова on 24.10.2023.
//

import UIKit

final class ContactListViewController: UITableViewController {
    var persons: [Person] = []
}

// MARK: - TableViewDataSource
extension ContactListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        persons.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let person = persons[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = person.fullName
        
        cell.contentConfiguration = content
        
        return cell
    }
}

// MARK: - Navigation
extension ContactListViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow {
            guard let detailInfoVC = segue.destination as? DetailsInfoViewController else { return }
            detailInfoVC.person = persons[indexPath.row]
        }
    }
}
