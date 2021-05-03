//
//  SwitchSeenVC.swift
//  RealEstateShorts
//
//  Created by rajesh gandru on 01/05/21.
//

import UIKit
class BookmarkCell: UITableViewCell {
    @IBOutlet weak var NewImgref: UIImageView!
    @IBOutlet weak var NewTitleLblref: UILabel!
    @IBOutlet weak var NewCategoryLblref: UILabel!
    @IBOutlet weak var NewDateLblref: UILabel!
    @IBOutlet weak var separatorlblref: UILabel!
}

class BookMarkSeenVC: UIViewController {

    @IBOutlet weak var BookMarktblref: UITableView!
    
    var titleArr = ["Published Today","Old News"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    



}
extension BookMarkSeenVC: UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        let view = UIView(frame: CGRect(x:0, y:0, width:tableView.frame.size.width, height:60))
        let label = UILabel(frame: CGRect(x:10, y:5, width:tableView.frame.size.width, height:50))
        label.font = UIFont(name: "Sora-Bold", size: 20.0)
        label.text = titleArr[section]
        view.addSubview(label);
        view.backgroundColor = UIColor.white;
        return view

    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:BookmarkCell = tableView.dequeueReusableCell(withIdentifier: "BookmarkCell", for: indexPath) as! BookmarkCell
        
        if 4 == indexPath.row {
            cell.separatorlblref.isHidden = true
        }else {
            cell.separatorlblref.isHidden = false
        }
        
        return cell
    }
    
    
}
