//
//  BaseScreenVC.swift
//  RealEstateShorts
//  Created by rajesh gandru on 01/05/21.
//

import UIKit

class BaseScreenVC: UIViewController {
    @IBOutlet weak var UiviewBottmref: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        
        
        UIView.animate(withDuration: 1.0, animations: {
             //Animations
            self.UiviewBottmref.constant = 54.0
            self.view.layoutIfNeeded()
            }) { (finished) in
            //Perform segue
            //self.UiviewBottmref.constant = 54.0
            }
        // Do any additional setup after loading the view.
    }
    

    @IBAction func loginBtnref(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "GuideSeenOneVC") as! GuideSeenOneVC
         self.navigationController?.pushViewController(vc, animated: true)
    }
    

}
