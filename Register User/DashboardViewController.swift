//
//  DashboardViewController.swift
//  Register User
//
//  Created by Pratik Gavit on 11/02/23.
//

import UIKit

class DashboardViewController: UIViewController {
    @IBOutlet weak var lblUser: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func logOutTapped(_ sender: Any) {
        ApiManager.shared.logOut(vc: self)
        
    }
    

}
