//
//  Constants.swift
//  jira-statistics-tracker
//
//  Created by Milan Parađina on 23.03.2022..
//

import Foundation
public struct K {
    public struct account {
        static let token = "your-atlassian-token"
        static let email = "your-atlassian-email"
    }
    
    public struct searchUrls {
      static let baseUrl = "https://your-company.atlassian.net/rest/api/2/"
      static let jqlSearchUrl = "search?jql=" //&maxResults=100
      static let yourprojectBoard = "search?jql=project=your-project"
      static let dateUrl = "search?jql=project=your-project-name%20AND%20created+%3E+2021-12-01%20AND%20created+%3C+2021-12-22"
      static let fieldsUrl = "issue/createmeta?projectKeys=project&expand=projects.issuetypes.fields"
      static let usersUrl = "user/assignable/search?project=project&maxResults=1000"
        
    }
    public struct segues {
       static let issues = "jiraIssue"
       static let users = "jiraUser"
       static let priority = "jiraPriority"
    }
    public struct cellNames {
        static let issueCell = "issueCell"
        static let userCell = "userCell"
        static let priorityCell = "priorityCell"
    }
    
    public struct popupAlerts {
        public struct alert {
            public struct title {
                static let error = "Error"
                static let success = "Success"
                static let noIssues = "No issues"
            }
            public struct description {
                static let errorData = "Could not find any data!\nTry enterting another URL!"
                static let errorSignIn = "Issues with signing in!\nCheck if you have entered the correct email and token"
                static let errorInfo = "Could not obtain the neccessary information!\nCheck if you're connected to the internet or have the permission to access the your-project board!"
            }
            public struct button {
                static let ok = "OK"
                static let yes = "Yes"
                static let no = "No"
                static let cancel = "Cancel"
            }
        }
        public struct spinner {
            static let logingIn = "Logging in..."
            static let gettingData = "Getting information..."
        }
    }

    public struct defaultValues {
        static let maxResults = "&maxResults=1000"
        static let startAt = "&startAt="
    }
    
    public struct timeInformation {
        public struct dateFormat {
            static let szFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
            static let normalFormat = "MM-dd-yyyy HH:mm:ss"
            static let basicFormat = "yyyy-MM-dd"
        }
        
        public struct dateStrings {
            static let dateNotAvailable = "Date not available"
            static let differenceNotAvailable = "Difference not available"
        }
    }
}
