//
//  Utilities.swift
//  jira-statistics-tracker
//
//  Created by Milan Parađina on 23.03.2022..
//

import Foundation
import UIKit

class Utilities {
    func convertDate(date: String?) -> String {
        let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = K.timeInformation.dateFormat.szFormat
        let newDateFormater = DateFormatter()
            newDateFormater.dateFormat = K.timeInformation.dateFormat.normalFormat
        if date != nil {
            let theDate = dateFormatter.date(from: date!)!
            let newDateString = newDateFormater.string(from: theDate)
            return newDateString
        } else {
            let currentDate = Date()
            let currentDateString = newDateFormater.string(from: currentDate)
            return currentDateString
        }
    }
    
    func showAlert(title : String, message: String, vc: UIViewController) {
         let alert = UIAlertController(
                 title: title,
                 message: message,
                 preferredStyle: UIAlertController.Style.alert
         )
         let ok = UIAlertAction(
            title: K.popupAlerts.alert.button.ok,
                 style: UIAlertAction.Style.default,
                 handler: nil
         )
         alert.addAction(ok)
        vc.present(alert, animated: true, completion: nil)
     }
    func showSpinner(message: String, vc: UIViewController) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 40, height: 50))
        alert.preferredContentSize = CGSize(width: 1000.0, height: 500.0)
        loadingIndicator.style = UIActivityIndicatorView.Style.medium
        loadingIndicator.startAnimating();
        alert.view.addSubview(loadingIndicator)
        vc.present(alert, animated: true, completion: nil)
    }
}
