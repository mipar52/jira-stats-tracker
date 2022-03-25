//
//  HomeController.swift
//  jira-statistics-tracker
//
//  Created by Milan Parađina on 23.03.2022..
//

import UIKit

class HomeController: UIViewController {

    let jiraHelper = JiraHelper()
    let utils = Utilities()
    
    var jiraIssues : [Issue]?
    var jiraUsers : [User]?
    var jiraPriority : [IssuePriority]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func jiraIssuesTapped(_ sender: UIButton) {
        self.utils.showSpinner(message: K.popupAlerts.spinner.gettingData , vc: self)
        jiraHelper.getJiraIssues(email: K.account.email, token: K.account.token, url: K.searchUrls.yourprojectBoard) { success, issues in
            self.dismiss(animated: true) {
                if success == true {
                    self.jiraIssues = issues
                    self.performSegue(withIdentifier: K.segues.issues, sender: self)
                } else {
                    self.utils.showAlert(title: K.popupAlerts.alert.title.error, message: K.popupAlerts.alert.description.errorData, vc: self)
                }
            }
        }
    }
    
    @IBAction func jiraUsersTapped(_ sender: UIButton) {
        self.utils.showSpinner(message: K.popupAlerts.spinner.gettingData, vc: self)
        jiraHelper.getprojectUsers(email: K.account.email, token: K.account.token) { success, users in
            self.dismiss(animated: true) {
                if success == true {
                    self.jiraUsers = users
                    self.performSegue(withIdentifier: K.segues.users, sender: self)
                } else {
                    self.utils.showAlert(title: K.popupAlerts.alert.title.error, message: K.popupAlerts.alert.description.errorData, vc: self)
                }
            }
        }
    }
    
    @IBAction func jiraPriorityTapped(_ sender: UIButton) {
        self.utils.showSpinner(message: K.popupAlerts.spinner.gettingData, vc: self)
        jiraHelper.getprojectPriority(email: K.account.email, token: K.account.token) { success, priority in
            self.dismiss(animated: true) {
                if success == true {
                    self.jiraPriority = priority
                    self.performSegue(withIdentifier: K.segues.priority, sender: self)
                } else {
                    self.utils.showAlert(title: K.popupAlerts.alert.title.error, message: K.popupAlerts.alert.description.errorData, vc: self)
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case K.segues.issues:
            let issuesVC = segue.destination as! JiraIssueController
            issuesVC.issues = jiraIssues
        case K.segues.users:
            let usersVC = segue.destination as! JiraUserController
            usersVC.users = jiraUsers
        case K.segues.priority:
            let priorityVC = segue.destination as! JiraPriorityController
            priorityVC.priority = jiraPriority  
        case .none:
            print("Something went wrong!")
        case .some(_):
            break
        }
    }
}
