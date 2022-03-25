//
//  UserController.swift
//  jira-statistics-tracker
//
//  Created by Milan Parađina on 23.03.2022..
//

import UIKit

class JiraUserController: UITableViewController {

    var users : [User]?
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users!.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellNames.userCell, for: indexPath)
        let user = users![indexPath.row]
        cell.textLabel?.text = user.displayName
        
        return cell
    }
}
