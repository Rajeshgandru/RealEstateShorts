//
//  SearchScreenVC.swift
//  RealEstateShorts
//
//  Created by rajesh gandru on 03/05/21.
//

import UIKit
class SearchTblCell: UITableViewCell {
    
}

class SearchScreenVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = true
        // Do any additional setup after loading the view.
    }
    

    @IBAction func PreviousBtnref(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
     }

}
extension SearchScreenVC : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: SearchTblCell = tableView.dequeueReusableCell(withIdentifier: "SearchTblCell", for: indexPath) as! SearchTblCell
        
        return cell
    }
    
    
}
