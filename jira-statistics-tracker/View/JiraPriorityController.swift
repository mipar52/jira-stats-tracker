//
//  JiraPriorityController.swift
//  jira-statistics-tracker
//
//  Created by Milan Parađina on 23.03.2022..
//

import UIKit

class JiraPriorityController: UITableViewController {

    var priority : [IssuePriority]?
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return priority!.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellNames.priorityCell, for: indexPath)
        let priorities = getPriorityName()
        
        cell.textLabel?.text = priorities[indexPath.row]
        
        return cell
    }
    
    func getPriorityName() -> [String]{
        var priorityArray : [String] = []
        for priorityy in priority! {
            let projects = priorityy.projects
            for project in projects {
                let issueTypes = project.issuetypes
                for issueType in issueTypes {
                    let values = issueType.fields.priority.allowedValues
                    for value in values {
                        priorityArray.append(value.name)
                    }
                }
            }
    }
        return priorityArray
}
}
