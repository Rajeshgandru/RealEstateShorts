//
//  AccountSeenVC.swift
//  RealEstateShorts
//
//  Created by rajesh gandru on 01/05/21.
//

import UIKit

class MyAccountCell: UITableViewCell {
    @IBOutlet weak var contentLblref: UILabel!
    
    @IBOutlet weak var separatorlblref: UILabel!
}

class AccountSeenVC: UIViewController {

    @IBOutlet weak var BackViewref: UIView!
    
    var ContentArr = ["Notifications","Terms & Conditions","Help & Support","Logout"]
    override func viewDidLoad() {
        super.viewDidLoad()

        self.BackViewref.masksToBounds = false
        self.BackViewref.layer.applyCornerRadiusShadow(color: .gray,
                                    alpha: 0.38,
                                    x: 1, y: -1,
                                    blur: 10,
                                    spread: 0,
                                    cornerRadiusValue: 24)
     }
    


}
extension AccountSeenVC : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ContentArr.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MyAccountCell = tableView.dequeueReusableCell(withIdentifier: "MyAccountCell", for: indexPath) as! MyAccountCell
        
        cell.contentLblref.text = ContentArr[indexPath.row]
        
        if ContentArr.count - 1 == indexPath.row {
            cell.separatorlblref.isHidden = true
        }else {
            cell.separatorlblref.isHidden = false
        }
        
        return cell
    }
    
    
}
extension CALayer {
    func applyCornerRadiusShadow(
        color: UIColor = .black,
        alpha: Float = 0.5,
        x: CGFloat = 0,
        y: CGFloat = 2,
        blur: CGFloat = 4,
        spread: CGFloat = 0,
        cornerRadiusValue: CGFloat = 0)
    {
        cornerRadius = cornerRadiusValue
        shadowColor = color.cgColor
        shadowOpacity = alpha
        shadowOffset = CGSize(width: x, height: y)
        shadowRadius = blur / 2.0
        if spread == 0 {
            shadowPath = nil
        } else {
            let dx = -spread
            let rect = bounds.insetBy(dx: dx, dy: dx)
            shadowPath = UIBezierPath(rect: rect).cgPath
        }
    }
}
