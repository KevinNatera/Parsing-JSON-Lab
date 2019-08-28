
//
//  RandomUserViewController.swift
//  ParsingJSONProj
//
//  Created by Kevin Natera on 8/27/19.
//  Copyright © 2019 Kevin Natera. All rights reserved.
//

import Foundation
import UIKit

class RandomUserViewController : UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var users = [User]()
    
    @IBOutlet weak var userTableOutlet: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = userTableOutlet.dequeueReusableCell(withIdentifier: "randomUsers")
        let user = users[indexPath.row]
        cell?.textLabel?.text = "\(user.name.title.capitalized). \(user.name.first.capitalized) \(user.name.last.capitalized)"
        cell?.detailTextLabel?.text = user.email
        return cell!
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let userDetailVC = segue.destination as? UserDetailViewController else { fatalError()}
        
        userDetailVC.person = users[userTableOutlet.indexPathForSelectedRow!.row]
    }
    
    
    
    private func loadData() {
        guard let pathToJSONFile = Bundle.main.path(forResource: "randomUsers", ofType: "json") else {
            fatalError("Couldn't find json file")
        }
        let url = URL(fileURLWithPath: pathToJSONFile)
        do {
            let data = try Data(contentsOf: url)
            let usersFromJSON = try Response.getRandomUsers(from: data)
            users = usersFromJSON
        } catch {
           print(error)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userTableOutlet.dataSource = self
        userTableOutlet.delegate = self
        loadData()
    }
}
