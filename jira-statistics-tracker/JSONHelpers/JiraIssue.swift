//
//  JiraIssue.swift
//  jira-statistics-tracker
//
//  Created by Milan Parađina on 23.03.2022..
//

import Foundation
struct JiraIssue: Decodable {
    let startAt: Int
    let maxResults: Int
    let total: Int
    let issues: [Issue]
}

struct Issue : Decodable {
    let key: String
    let `self`: String
    let fields: Fields
}

struct Fields: Decodable {
    let summary: String?
    let created: String
    let priority: Priority
    let assignee: Assignee?
    let creator: Creator
    let status : Status
    let statuscategorychangedate : String
}

struct Priority: Decodable {
    let name: String
}

struct Status : Decodable {
    let name: String
}

struct Assignee : Decodable {
    let displayName: String
}

struct Creator: Decodable {
    let displayName: String
}
