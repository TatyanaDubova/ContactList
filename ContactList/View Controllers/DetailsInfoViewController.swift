//
//  ViewController.swift
//  ContactList
//
//  Created by Татьяна Дубова on 24.10.2023.
//

import UIKit

final class DetailsInfoViewController: UIViewController {

    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    var person: Person?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let person else { return }
        
        navigationItem.title = person.fullName

        phoneLabel.text = "Phone: \(person.phoneNumber)"
        emailLabel.text = "Email: \(person.email)"
    }
}

