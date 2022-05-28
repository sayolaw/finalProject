//
//  CreateSiteViewController.swift
//  finalProject
//
//  Created by Sayo Lawal on 2022-05-26.
//

import UIKit
import CoreData

class CreateSiteViewController: UIViewController {
   
    @IBOutlet weak var titleInput: UITextField!
    @IBOutlet weak var latitudeInput: UITextField!
    @IBOutlet weak var longitudeInpute: UITextField!
    
    
    @IBAction func saveNewSite(_ sender: Any) {
        print("buttonside")
        let titleInput = titleInput.text ?? "No title"
        let latitudeInput = Double(latitudeInput.text ?? "0.0") ?? 0.0
        let longitudeInput = Double(longitudeInpute.text ?? "0.0") ?? 0.0
        appendSite(title: titleInput, latitude: latitudeInput, longitude: longitudeInput)
    }
    var sites = [Site]()
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var managedContext:NSManagedObjectContext!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        NotificationCenter.default.addObserver(self, selector: #selector(saveCoreData), name: UIApplication.willResignActiveNotification, object: nil)
        managedContext = appDelegate.persistentContainer.viewContext
        loadCoreData()
       
    }
    func appendSite(title:String, latitude: Double, longitude: Double){
        print("append side")
        let site = Site(context: managedContext)
        site.title = title
        site.latitude = Double(latitude)
        site.longitude = Double(longitude)
        sites.append(site)

        
    }
    @objc func saveCoreData(){
     clearCoreData()
        for site in sites{
            
            let siteEntity = NSEntityDescription.insertNewObject(forEntityName: "Site", into: managedContext)
            siteEntity.setValue(site.title, forKey: "title")
            siteEntity.setValue(site.latitude, forKey: "latitude")
            siteEntity.setValue(site.longitude, forKey: "longitude")
     
            
        }
        appDelegate.saveContext()
    }
    func loadCoreData(){
        print("here")
        sites = [Site]()
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Site")
        do{
            let results = try managedContext.fetch(fetchRequest)
            if results is [NSManagedObject]{
                print(results)
                for result in (results as! [NSManagedObject]){
                    let title = result.value(forKey: "title") as! String
                    let latitude = result.value(forKey: "latitude") as! Double
                    let longitude = result.value(forKey: "longitude") as! Double
                   appendSite(title: title, latitude: latitude, longitude: longitude)
                    print(sites)
                }
            }
        } catch{
            print(error)
        }
    }
    func clearCoreData(){
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Site")
        do{
            let results = try managedContext.fetch(fetchRequest)
                for result in (results as! [NSManagedObject]){
                    if let managedObject = result as? NSManagedObject{
                        managedContext.delete(managedObject)
                }
            }
        } catch{
            print(error)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showCollection" {
          
 
//            print("this is the \(site.name)")
                let destinationController = segue.destination as! SiteCollectionViewController
           
            destinationController.sites = self.sites
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
