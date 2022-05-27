//
//  CreateSiteViewController.swift
//  finalProject
//
//  Created by Sayo Lawal on 2022-05-26.
//

import UIKit

class CreateSiteViewController: UIViewController {

    @IBOutlet weak var titleInput: UITextField!
    @IBOutlet weak var latitudeInput: UITextField!
    @IBOutlet weak var longitudeInpute: UITextField!
    var site : Site?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "createSite" {
            site = Site(image: "Bodrum.jpg", name: titleInput.text!,latitude: Double(latitudeInput.text!)!,longitude: Double(longitudeInpute.text!)!)
            
            print("this is the \(site?.title)")
                let destinationController = segue.destination as! SiteDetailViewController
           
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
