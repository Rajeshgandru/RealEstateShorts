//
//  SettingsSeenVC.swift
//  RealEstateShorts
//
//  Created by rajesh gandru on 05/05/21.
//

import UIKit
class SettingsTblCell: UITableViewCell {
    @IBOutlet weak var contentLblref: UILabel!
    @IBOutlet weak var separatorlblref: UILabel!
    @IBOutlet weak var ForwardIconref: UIImageView!
}
class SettingsTblCell2: UITableViewCell {
    @IBOutlet weak var contentLblref: UILabel!
    @IBOutlet weak var separatorlblref: UILabel!
    @IBOutlet weak var TogleSwitchBtnref: UIButton!
}

class SettingsSeenVC: UIViewController {
    
    @IBOutlet weak var BackViewref: UIView!

    var settingsArr = ["Feed back","Invite your friends","Night Mode","About us","Rate the app"]
    
    @IBOutlet weak var Settingstblref: UITableView!
    
    var istoggleselected = false

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = true
       
        // Do any additional setup after loading the view.
        self.BackViewref.masksToBounds = false
        self.BackViewref.layer.applyCornerRadiusShadow(color: .gray,
                                    alpha: 0.38,
                                    x: 1, y: -1,
                                    blur: 10,
                                    spread: 0,
                                    cornerRadiusValue: 24)
    }
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
    }

    @IBAction func backBtnref(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
extension SettingsSeenVC: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingsArr.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 2 {
            let cell:SettingsTblCell2 = tableView.dequeueReusableCell(withIdentifier: "SettingsTblCell2", for: indexPath) as! SettingsTblCell2
            cell.contentLblref.text = settingsArr[indexPath.row]

            cell.TogleSwitchBtnref.tag = indexPath.row
            cell.TogleSwitchBtnref.addTarget(self, action: #selector(toggleBtnref), for: .touchUpInside)
            
            if settingsArr.count - 1 == indexPath.row {
                cell.separatorlblref.isHidden = true
            }else {
                cell.separatorlblref.isHidden = false
            }
             cell.TogleSwitchBtnref.setImage(self.istoggleselected ? #imageLiteral(resourceName: "dotColorIcon") : #imageLiteral(resourceName: "unselectDotColoricon"), for: .normal)
            
            
            return cell
        }else {
            let cell:SettingsTblCell = tableView.dequeueReusableCell(withIdentifier: "SettingsTblCell", for: indexPath) as! SettingsTblCell
            
            cell.contentLblref.text = settingsArr[indexPath.row]
            
            if indexPath.row == 1 || indexPath.row == 4 {
                cell.ForwardIconref.isHidden = false
            }else {
                cell.ForwardIconref.isHidden = true
            }

            if settingsArr.count - 1 == indexPath.row {
                cell.separatorlblref.isHidden = true
            }else {
                cell.separatorlblref.isHidden = false
            }
            
            return cell
        }
    }
    
    @objc func toggleBtnref(sender : Any){
        self.istoggleselected = self.istoggleselected ? false: true
        self.Settingstblref.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 1 {
            let storyBoard: UIStoryboard = UIStoryboard(name: "DashBoard", bundle: nil)
            let vc = storyBoard.instantiateViewController(withIdentifier: "InviteFriendsVC") as! InviteFriendsVC
             self.navigationController?.pushViewController(vc, animated: true)
        }else  if indexPath.row == 4 {
            let storyBoard: UIStoryboard = UIStoryboard(name: "DashBoard", bundle: nil)
            let vc = storyBoard.instantiateViewController(withIdentifier: "RateTheAppVC") as! RateTheAppVC
             self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
