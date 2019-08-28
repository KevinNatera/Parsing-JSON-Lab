//
//  UserDetailViewController.swift
//  ParsingJSONProj
//
//  Created by Kevin Natera on 8/27/19.
//  Copyright © 2019 Kevin Natera. All rights reserved.
//

import Foundation
import UIKit

class UserDetailViewController : UIViewController {
    var person: User!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var phoneLabel: UILabel!
    
    @IBOutlet weak var dobLabel: UILabel!
    
    @IBOutlet weak var addressLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = "\(person.name.title.capitalized). \(person.name.first.capitalized) \(person.name.last.capitalized)"
        
        phoneLabel.text = person.phone

        addressLabel.text = "\(person.location.street.capitalized) \(person.location.city.capitalized) , \(person.location.state.capitalized)"
        
        dobLabel.text = ""
        
        for (i,v) in person.dob.date.enumerated() {
            if i <= 9 {
                dobLabel.text?.append(v)
            }
        }
    }
}
