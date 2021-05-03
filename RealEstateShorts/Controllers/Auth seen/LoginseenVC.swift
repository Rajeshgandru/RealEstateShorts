//
//  LoginseenVC.swift
//  RealEstateShorts
//
//  Created by rajesh gandru on 01/05/21.
//

import UIKit

class LoginseenVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func signUpBtnref(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
       let vc = storyBoard.instantiateViewController(withIdentifier: "RegistartionseenVC") as! RegistartionseenVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    @IBAction func signINBtnref(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "DashBoard", bundle: nil)
       let vc = storyBoard.instantiateViewController(withIdentifier: "TabBarVC") as! TabBarVC
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
