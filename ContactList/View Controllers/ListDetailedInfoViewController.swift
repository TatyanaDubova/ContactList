//
//  ContactListDetailedInformationViewController.swift
//  ContactList
//
//  Created by Татьяна Дубова on 24.10.2023.
//

import UIKit

final class ListDetailedInfoViewController: UITableViewController {
    var persons: [Person] = []
}

// MARK: - TableViewDataSource
extension ListDetailedInfoViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        persons.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        persons[section].fullName
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        header.textLabel?.textColor = .black
        header.contentView.backgroundColor = .lightGray
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let person = persons[indexPath.section]
        var content = cell.defaultContentConfiguration()
        
        if indexPath.row == 0 {
            content.image = UIImage(systemName: "phone")
            content.text = person.phoneNumber
            
        } else {
            content.image = UIImage(systemName: "envelope")
            content.text = person.email
        }
        
        cell.contentConfiguration = content
        return cell
    }
}
