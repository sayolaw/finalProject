//
//  ViewController.swift
//  finalProject
//
//  Created by Sayo Lawal on 2022-05-25.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    let vappDelegate = UIApplication.shared.delegate as! AppDelegate
    var vmanagedContext:NSManagedObjectContext!
    var sites = [Site]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//       clearCoreData()
//        vappDelegate.saveContext()
        // Do any additional setup after loading the view.
    
        

        
//        NotificationCenter.default.addObserver(self, selector: #selector(saveCoreData), name: UIApplication.willResignActiveNotification, object: nil)
        vmanagedContext = vappDelegate.persistentContainer.viewContext
      
        loadCoreData()
        
      
        
        
    }
 
    func appendSite(title:String, latitude: Double, longitude: Double,image:[Data]){

        let site = Site(context: vmanagedContext)
        site.title = title

        site.latitude = Double(latitude)
        site.longitude = Double(longitude)

        site.image = image[0]
        site.image1 = image[1]
        site.image2 = image[2]
        sites.append(site)





    }
//    @objc func saveCoreData(){
//     clearCoreData()
//        for site in sites{
//
//            let siteEntity = NSEntityDescription.insertNewObject(forEntityName: "Site", into: managedContext)
//
//            siteEntity.setValue(site.title, forKey: "title")
//            siteEntity.setValue(site.image, forKey: "image")
//            siteEntity.setValue(site.image1, forKey: "image1")
//            siteEntity.setValue(site.image2, forKey: "image2")
//            siteEntity.setValue(site.latitude, forKey: "latitude")
//            siteEntity.setValue(site.longitude, forKey: "longitude")
//
//
//
//        }
//        appDelegate.saveContext()
//    }
    func loadCoreData(){



        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Site")
        do{
            let results = try vmanagedContext.fetch(fetchRequest)
            if results is [NSManagedObject]{

                for result in (results as! [NSManagedObject]){

                    let title = result.value(forKey: "title") as! String
                    let latitude = result.value(forKey: "latitude") as! Double
                    let longitude = result.value(forKey: "longitude") as! Double
                    print("view controller \(title)")
                    let image = result.value(forKey: "image") as! Data
                    let image1 = result.value(forKey: "image1") as! Data
                    let image2 = result.value(forKey: "image2") as! Data
                    let imageCollection = [image,image1,image2]


                    appendSite(title: title, latitude: latitude, longitude: longitude, image: imageCollection)


                }
            }
        } catch{
            print(error)
        }
    }
    func clearCoreData(){
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Site")
        do{
            let results = try vmanagedContext.fetch(fetchRequest)
                for result in (results as! [NSManagedObject]){
                    if let managedObject = result as? NSManagedObject{
                        vmanagedContext.delete(managedObject)
                }
            }
        } catch{
            print(error)
        }

    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "viewSites" {
          
 
//            print("this is the \(site.name)")
                let destinationController = segue.destination as! SiteCollectionViewController
           
            destinationController.sites = self.sites
//                collectionView.deselectItem(at: indexPaths[0], animated: true)
            }
        else if segue.identifier == "createSite"{
            let destinationController = segue.destination as! CreateSiteViewController
            destinationController.sites = sites
            
        }
        
    }



}

