//
//  SiteCollectionViewController.swift
//  finalProject
//
//  Created by Sayo Lawal on 2022-05-26.
//

import UIKit
import CoreData

private let reuseIdentifier = "Cell"

class SiteCollectionViewController: UICollectionViewController {

    var sites = [Site]()
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var managedContext:NSManagedObjectContext!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        
        return sites.count
        
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = UICollectionViewCell()
        
        if let siteCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? SiteCollectionViewCell{
            
            siteCell.configure(with: sites[indexPath.row].title ?? "")
            
            cell = siteCell
            
        }
    

    
        return cell

    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPaths = collectionView.indexPathsForSelectedItems{
                let destinationController = segue.destination as! SiteDetailViewController
                print(sites[indexPaths[0].row]);
                destinationController.site = sites[indexPaths[0].row]
//                collectionView.deselectItem(at: indexPaths[0], animated: true)
            }
        }

    }
    @IBAction func unwindToMain(segue: UIStoryboardSegue){
           print("left")
       }

}
