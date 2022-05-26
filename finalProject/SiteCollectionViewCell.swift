//
//  SiteCollectionViewCell.swift
//  finalProject
//
//  Created by Sayo Lawal on 2022-05-26.
//

import UIKit

class SiteCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var siteLabel: UILabel!
    
    func configure(with site:String){
        siteLabel.text = site
    }
    
}
