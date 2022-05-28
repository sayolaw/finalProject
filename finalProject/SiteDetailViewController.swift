//
//  SiteDetailViewController.swift
//  finalProject
//
//  Created by Sayo Lawal on 2022-05-26.
//

import UIKit

class SiteDetailViewController: UIViewController {
    @IBOutlet weak var siteTitle: UILabel!
    @IBOutlet weak var firstImage: UIImageView!
    @IBOutlet weak var secondImage: UIImageView!
    @IBOutlet weak var thirdImage: UIImageView!
    
    var site : Site?
    override func viewDidLoad() {
        super.viewDidLoad()
        siteTitle.text = site?.title
        firstImage.image = UIImage(data: (site?.image)!)
        secondImage.image = UIImage(data: (site?.image1)!)
        thirdImage.image = UIImage(data: (site?.image2)!)
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMap" {

                let destinationController = segue.destination as! MapViewController
           
                destinationController.site = site
//                collectionView.deselectItem(at: indexPaths[0], animated: true)
            }
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
