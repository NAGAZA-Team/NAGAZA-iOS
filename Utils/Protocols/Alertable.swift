//
//  Alertable.swift
//  Nagaza
//
//  Created by 전성훈 on 2023/10/19.
//

import UIKit

protocol Alertable {}

extension Alertable where Self: UIViewController {
    typealias AlertAction = (
        title: String,
        style: UIAlertAction.Style,
        handler: (() -> Void)?
    )

    func showAlert(
        title: String?,
        message: String?,
        preferredStyle: UIAlertController.Style = .alert,
        actions: [AlertAction] = [("확인", .default, nil)]
    ) {
        let alertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: preferredStyle
        )
        
        for action in actions {
            let actionItem = UIAlertAction(
                title: action.title,
                style: action.style
            ) { _ in
                action.handler?()
            }
            
            if action.style == .destructive {
                actionItem.setValue(UIColor.red, forKey: "titleTextColor")
            }
            
            alertController.addAction(actionItem)
        }
        
        present(alertController, animated: true)
    }
    
    func showActionSheet(
        title: String?,
        message: String?,
        actions: [AlertAction]
    ) {
        showAlert(
            title: title,
            message: message,
            preferredStyle: .actionSheet,
            actions: actions
        )
    }
}
