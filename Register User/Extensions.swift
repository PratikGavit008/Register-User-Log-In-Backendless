//
//  Extensions.swift
//  Register User
//
//  Created by Pratik Gavit on 11/02/23.
//

import UIKit

extension UIViewController {
    func showAlert(title: String, message: String, completion: (()->Void)?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            completion?()
            }
            alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    
}
