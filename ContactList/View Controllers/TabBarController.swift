//
//  TabBarController.swift
//  ContactList
//
//  Created by Татьяна Дубова on 25.10.2023.
//

import UIKit

final class TabBarController: UITabBarController {
    
    private let persons = Person.getNewMixedContactList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        transferData()
    }
    
    private func transferData() {
        guard let viewControllers else { return }
        
        viewControllers.forEach {
            if let contactListVC = $0 as? ContactListViewController {
                contactListVC.persons = persons
            } else if let listDetailedInfoVC = $0 as? ListDetailedInfoViewController {
                listDetailedInfoVC.persons = persons
            }
        }
    }
}
