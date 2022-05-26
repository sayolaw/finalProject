//
//  SiteDetailViewController.swift
//  finalProject
//
//  Created by Sayo Lawal on 2022-05-26.
//

import UIKit

class SiteDetailViewController: UIViewController {
    @IBOutlet weak var siteTitle: UILabel!
    var site = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        siteTitle.text = site
        // Do any additional setup after loading the view.
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
