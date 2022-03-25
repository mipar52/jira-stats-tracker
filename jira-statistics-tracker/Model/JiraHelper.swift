//
//  JiraHelper.swift
//  jira-statistics-tracker
//
//  Created by Milan Parađina on 23.03.2022..
//

import Foundation
import Networking

class JiraHelper {
    
    let utils = Utilities()
    var networking = Networking(baseURL: K.searchUrls.baseUrl)

    func getJiraIssues(email: String, token: String, url: String, completionHandler: @escaping (Bool, [Issue]?) -> Void) {
        networking.setAuthorizationHeader(username: email, password: token)
        networking.get(K.searchUrls.yourprojectBoard) { result in
            switch result {
            case .success(let response):
                do {
                    let issueInfo = try JSONDecoder().decode(JiraIssue.self, from: response.data)
                    let issues = issueInfo.issues
                    for issue in issues {
                        print(issue.fields.summary)
                    }
                    completionHandler(true, issues)
                } catch {
                    print(error)
                }
            case .failure(let response):
                print("error: \(response)")
                completionHandler(false, nil)
            }
        }
    }
    func getJiraIssuesFromSpecificProject(email: String, token: String, url: String, project: String, completionHandler: @escaping (Bool, [Issue]?) -> Void) {
        networking.setAuthorizationHeader(username: email, password: token)
        networking.get(K.searchUrls.jqlSearchUrl + "project=\(project)") { result in
            switch result {
            case .success(let response):
                do {
                    let issueInfo = try JSONDecoder().decode(JiraIssue.self, from: response.data)
                    let issues = issueInfo.issues
                    completionHandler(true, issues)
                } catch {
                    print(error)
                }
            case .failure(let response):
                print("error: \(response)")
                completionHandler(false, nil)
            }
        }
    }
    func getJiraIssuesWithSpecificDate(email: String, token: String, url: String, dateFrom: String, dateTo: String, completionHandler: @escaping (Bool, [Issue]?) -> Void) {
        networking.setAuthorizationHeader(username: email, password: token)
        networking.get(K.searchUrls.yourprojectBoard) { result in
            switch result {
            case .success(let response):
                do {
                    let issueInfo = try JSONDecoder().decode(JiraIssue.self, from: response.data)
                    let issues = issueInfo.issues
                    completionHandler(true, issues)
                } catch {
                    print(error)
                }
            case .failure(let response):
                print("error: \(response)")
                completionHandler(false, nil)
            }
        }
    }
    
    func getprojectUsers(email: String, token: String, completionHandler: @escaping (Bool, [User]?) -> Void) {
        networking.setAuthorizationHeader(username: email, password: token)
        networking.get(K.searchUrls.usersUrl) { result in
            switch result {
            case .success(let response):
                do {
                    let users = try JSONDecoder().decode([User].self, from: response.data)
                    completionHandler(true, users)
                } catch {
                    print(error)
                }
            case .failure(let response):
                completionHandler(false, nil)
                print("error: \(response)")
            }
        }
    }
    
    func getprojectPriority(email: String, token: String, completionHandler: @escaping (Bool, [IssuePriority]?) -> Void) {
        networking.setAuthorizationHeader(username: email, password: token)
        networking.get(K.searchUrls.fieldsUrl) { result in
            switch result {
            case .success(let response):
                do {
                    let priority = try JSONDecoder().decode(IssuePriority.self, from: response.data)
                    completionHandler(true, [priority])
                } catch {
                    print(error)
                }
            case .failure(let response):
                print("error: \(response)")
                completionHandler(false, nil)
            }
        }
    }
}
