//
//  InviteFriendsVC.swift
//  RealEstateShorts
//
//  Created by rajesh gandru on 05/05/21.
//

import UIKit

class InviteFriendsVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = true
        // Do any additional setup after loading the view.
    }
    

  
    @IBAction func backbtnref(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
