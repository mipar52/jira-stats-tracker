A simple application demonstrating the usage of Jira REST API via Networking, a simple networking library, with Swift

## Pre-requirements:

An Atlassian Account that has access to Jira:\
https://id.atlassian.com/login

Atlassian API Token (PAT) for accessing the API:\
https://id.atlassian.com/manage-profile/security/api-tokens

## Usage:

Using Atlassian's PAT:\
https://confluence.atlassian.com/enterprise/using-personal-access-tokens-1026032365.html#:~:text=Personal%20access%20tokens%20(PATs)%20are,in%20all%20scripts%20and%20integrations.

The sample application is designed to demonstrate the most common requests:

    1. Getting all Jira issues

    2. Getting Jira issues from a specific period of time (between two dates)

    3. Getting Jira issues from a specific project

    4. Getting all users which are registered on Jira
    
    5. Getting all priorities which a Jira issue can be marked with 

## Jira REST API:

Jira Rest API:\
https://developer.atlassian.com/server/jira/platform/rest-apis/

API examples:\
https://developer.atlassian.com/server/jira/platform/jira-rest-api-examples/

## JSON

The JSON models can be found in the `JSONHelpers` directory.

With `JiraIssue` JSON, information like the issue name, assignee, priority, when the issue was created can be obtained, while on `JiraUser` and `JiraPriority` the name can be obtained.


## Requests

All of the requests are done via Networking.
For the base URL, you can place the following URL:\ `https://your-company.atlassian.net/rest/api/2/`

Example:\
`let networking = Networking(baseURL: https://your-company.atlassian.net/rest/api/2/)`

After the base URL has been placed, with every request, you need to set the authorisation header, which contains your e-mail (that is registered on Atlassian) and Atlassian PAT:\
`networking.setAuthorizationHeader(username: "your-email", password: "your-PAT")`

After setting the header, you can now use the `get` method with the information you want to search:

```
let networking = Networking(baseURL: https://your-company.atlassian.net/rest/api/2/)
    networking.setAuthorizationHeader(username: "your-email", password: "your-PAT")
    networking.get("search?jql=project=Batman") { result in
         switch result {
            case .success(let response):
                do {
                    let issueInfo = try JSONDecoder().decode(JiraIssue.self, from: response.data)
                    let issues = issueInfo.issues
                    
                        for issue in issues {
                        print(issue.fields.summary)
                        
                    }
                } catch {
                    print(error)
                }
            case .failure(let response):
                print("error: \(response)")
            }
        }
```
The example above shows how to obtain all of the issue from a project called "Batman".

### Run the project 

    1. Make sure you're you're registered on Atlassian and obtained its PAT

    2. Add your information (email, token, and project) in the Networking requests

    3. Run command  `pod install` when positioned yourself in the project's directory in Terminal
    
    4. The sample project can be both run & built on iOS and Mac Catalyst 
