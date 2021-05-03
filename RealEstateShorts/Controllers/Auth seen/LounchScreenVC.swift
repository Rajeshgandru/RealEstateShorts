//
//  LounchScreenVC.swift
//  RealEstateShorts
//
//  Created by rajesh gandru on 01/05/21.
//

import UIKit

class LounchScreenVC: UIViewController {
    
    @IBOutlet weak var centerImgref: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
      
//        UIView.animate(withDuration: 0.5, delay: 0.0, options: UIView.AnimationOptions.curveEaseOut, animations: {
//
//               // HERE
//               self.centerImgref.transform = CGAffineTransform.identity.scaledBy(x: 0, y: 0) // Scale your image
//
//         }
//        ) { (finished) in
//             UIView.animate(withDuration: 1, animations: {
//
//              self.centerImgref.transform = CGAffineTransform.identity // undo in 1 seconds
//
//           })
//        }
        
        
        UIView.animate(withDuration: 1.0, animations: {() -> Void in
            self.centerImgref?.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        }, completion: {(_ finished: Bool) -> Void in
            UIView.animate(withDuration: 1.0, delay: 3.0, options: [], animations: {
                //Animations
                    self.centerImgref?.transform = CGAffineTransform(scaleX: 1, y: 1)
                }) { (finished) in
                //Perform segue
                    let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let vc = storyBoard.instantiateViewController(withIdentifier: "BaseScreenVC") as! BaseScreenVC
                     self.navigationController?.pushViewController(vc, animated: true)
                }
          })
     }
    


}
