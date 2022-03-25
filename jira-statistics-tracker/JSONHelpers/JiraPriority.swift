//
//  JiraPriority.swift
//  jira-statistics-tracker
//
//  Created by Milan Parađina on 23.03.2022..
//

import Foundation

struct IssuePriority: Decodable {
    let projects : [PriorityProjects]
}

struct PriorityProjects : Decodable {
    let issuetypes : [PriorityIssueTypes]
}

struct PriorityIssueTypes: Decodable {
    let fields: PriorityFields
}
struct PriorityFields: Decodable {
    let priority : Priorityy
}

struct Priorityy: Decodable {
    let allowedValues : [PriorityAllowedValues]
}

struct PriorityAllowedValues : Decodable {
    let name: String
}
