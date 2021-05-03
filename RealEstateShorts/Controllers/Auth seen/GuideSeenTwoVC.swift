//
//  GuideSeenTwoVC.swift
//  RealEstateShorts
//
//  Created by rajesh gandru on 01/05/21.
//

import UIKit

class GuideSeenTwoVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func nextBtnref(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "GuideSeenThreeVC") as! GuideSeenThreeVC
         self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func PreviousBtnref(_ sender: Any) {
          self.navigationController?.popViewController(animated: true)
    }
  

}
