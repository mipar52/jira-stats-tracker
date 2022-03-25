//
//  IssueController.swift
//  jira-statistics-tracker
//
//  Created by Milan Parađina on 23.03.2022..
//

import UIKit
import Foundation

class JiraIssueController: UITableViewController {
    let utils = Utilities()
    var issues : [Issue]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return issues!.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellNames.issueCell, for: indexPath)
        let issue = issues![indexPath.row]
        cell.textLabel?.text = issue.fields.summary
        cell.detailTextLabel?.text = self.utils.convertDate(date: issue.fields.created)
        
        return cell
    }
    

}
