//
//  HomeseenVC.swift
//  RealEstateShorts
//
//  Created by rajesh gandru on 01/05/21.
//

import UIKit
import ImageSlideshow
class SuggestedNewsCell: UICollectionViewCell {
    @IBOutlet weak var titleLblref: EdgeInsetLabel!
  }

class TopNewsCell: UICollectionViewCell {
    @IBOutlet weak var titleLblref: EdgeInsetLabel!
  }


class HomeseenVC: UIViewController {
    @IBOutlet var slideshow: ImageSlideshow!

    @IBOutlet weak var TopNewsColectionref: UICollectionView!
    var suggestedArr = ["Area","Builder","City","Budget","Land","Area","Builder","City","Budget","Land..................rwe32423....324234"]
    
    let localSource = [BundleImageSource(imageString: "img1"), BundleImageSource(imageString: "img2"), BundleImageSource(imageString: "img3"), BundleImageSource(imageString: "img4")]
//    let afNetworkingSource = [AFURLSource(urlString: "https://images.unsplash.com/photo-1432679963831-2dab49187847?w=1080")!, AFURLSource(urlString: "https://images.unsplash.com/photo-1447746249824-4be4e1b76d66?w=1080")!, AFURLSource(urlString: "https://images.unsplash.com/photo-1463595373836-6e0b0a8ee322?w=1080")!]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.LoadImagesView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
    
    @IBAction func movetoSearchScreenbtnref(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "DashBoard", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "SearchScreenVC") as! SearchScreenVC
         self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func movetoSettingsScreenbtnref(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "DashBoard", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "SettingsSeenVC") as! SettingsSeenVC
         self.navigationController?.pushViewController(vc, animated: true)
    }

}
extension HomeseenVC: UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == TopNewsColectionref {
            return 8
        }else {
        return suggestedArr.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == TopNewsColectionref {
            let cell:TopNewsCell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopNewsCell", for: indexPath) as! TopNewsCell
            return cell
        }else {
        let cell:SuggestedNewsCell = collectionView.dequeueReusableCell(withReuseIdentifier: "SuggestedNewsCell", for: indexPath) as! SuggestedNewsCell
         cell.titleLblref.textInsets = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
        
        let randomRed:CGFloat = CGFloat(arc4random_uniform(256))
        let randomGreen:CGFloat = CGFloat(arc4random_uniform(256))
        let randomBlue:CGFloat = CGFloat(arc4random_uniform(256))
        let myColor =  UIColor(red: randomRed/255, green: randomGreen/255, blue: randomBlue/255, alpha: 1.0)
        
        cell.titleLblref.backgroundColor = myColor
        
        cell.titleLblref.text = suggestedArr[indexPath.row]
        return cell
        }
    }
    
    
}
extension HomeseenVC: ImageSlideshowDelegate {
     func LoadImagesView(){

        slideshow.slideshowInterval = 5.0
        slideshow.pageIndicatorPosition = .init(horizontal: .center, vertical: .under)
        slideshow.contentScaleMode = UIViewContentMode.scaleAspectFill


        
        let pageControl = UIPageControl()
        pageControl.currentPageIndicatorTintColor = UIColor(named: "#BE78F8")
        pageControl.pageIndicatorTintColor = .lightGray
        self.slideshow.pageIndicator = pageControl
        
        
         //withSlideshowColors()

        // optional way to show activity indicator during image load (skipping the line will show no activity indicator)
        slideshow.activityIndicator = DefaultActivityIndicator()
        slideshow.delegate = self

        // can be used with other sample sources as `afNetworkingSource`, `alamofireSource` or `sdWebImageSource` or `kingfisherSource`
        slideshow.setImageInputs(localSource)

        let recognizer = UITapGestureRecognizer(target: self, action: #selector(self.didTap))
        slideshow.addGestureRecognizer(recognizer)
    }
    

    @objc func didTap() {
        let fullScreenController = slideshow.presentFullScreenController(from: self)
        // set the activity indicator for full screen controller (skipping the line will show no activity indicator)
        fullScreenController.slideshow.activityIndicator = DefaultActivityIndicator(style: .white, color: nil)
    }
    
    func imageSlideshow(_ imageSlideshow: ImageSlideshow, didChangeCurrentPageTo page: Int) {
       // print("current page:", page)
    }
}
