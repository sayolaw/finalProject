//
//  CreateSiteViewController.swift
//  finalProject
//
//  Created by Sayo Lawal on 2022-05-26.
//

import UIKit
import CoreData

class CreateSiteViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
   
    @IBOutlet weak var titleInput: UITextField!
    @IBOutlet weak var latitudeInput: UITextField!
    @IBOutlet weak var longitudeInpute: UITextField!
    
    var imageArr = [Data]()
    var count = 0
    var sites = [Site]()
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var managedContext:NSManagedObjectContext!
    var image = UIImage()
    var saveImage : Data!
    var nextImage : Data!
    

    @IBAction func picture(_ sender: Any) {
        count+=1
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.allowsEditing = false
        vc.delegate = self
        present(vc, animated: true)
    }
    
    
    @IBAction func saveNewSite(_ sender: Any) {
       
        let titleInput = titleInput.text ?? "No title"
        let latitudeInput = Double(latitudeInput.text ?? "0.0") ?? 0.0
        let longitudeInput = Double(longitudeInpute.text ?? "0.0") ?? 0.0
        appendSite(title: titleInput, latitude: latitudeInput, longitude: longitudeInput,image: imageArr)
    }

  
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        NotificationCenter.default.addObserver(self, selector: #selector(saveCoreData), name: UIApplication.willResignActiveNotification, object: nil)
        managedContext = appDelegate.persistentContainer.viewContext
//        loadCoreData()
        
        
       
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let possibleImage = info[.editedImage] as? UIImage{
           
            saveImage = possibleImage.jpegData(compressionQuality: 1.0)!
            
            imageArr.append(saveImage)
            
        }
        else if let possibleImage = info[.originalImage] as? UIImage {
           
            saveImage = possibleImage.jpegData(compressionQuality: 1.0)!
            imageArr.append(saveImage)
            
        }
        else{
            return
        }
        
        dismiss(animated: true)
    }
    
    private func appendSite(title:String, latitude: Double, longitude: Double, image:[Data]){
       
        let site = Site(context: managedContext)
        site.title = title

        site.latitude = Double(latitude)
        site.longitude = Double(longitude)

        site.image = image[0]
//        site.image1 = image[1]
//        site.image2 = image[2]
//        site.sayo = "Hello"
        sites.append(site)
        
    
      
        

        
    }
    @objc func saveCoreData(){
     clearCoreData()
        for site in sites{
            
            let siteEntity = NSEntityDescription.insertNewObject(forEntityName: "Site", into: managedContext)
            
            siteEntity.setValue(site.title, forKey: "title")
            siteEntity.setValue(site.image, forKey: "image")
//            siteEntity.setValue(site.image1, forKey: "image1")
//            siteEntity.setValue(site.image2, forKey: "image2")
            siteEntity.setValue(site.latitude, forKey: "latitude")
            siteEntity.setValue(site.longitude, forKey: "longitude")
            
           
            
        }
        appDelegate.saveContext()
    }
    func loadCoreData(){
        
        
       
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Site")
       
        do{
            let results = try managedContext.fetch(fetchRequest)
            
            if results is [NSManagedObject]{
         
               
                for result in (results as! [NSManagedObject]){
                    
                    let title = result.value(forKey: "title") as! String
                  
                    let latitude = result.value(forKey: "latitude") as! Double
                    let longitude = result.value(forKey: "longitude") as! Double
                    
                    let image = result.value(forKey: "image") as! Data
//                    let image1 = result.value(forKey: "image1") as! Data
//                    let image2 = result.value(forKey: "image2") as! Data
                    let imageCollection = [image]
                   print(title)
                  
                    appendSite(title: title, latitude: latitude, longitude: longitude,image:imageCollection)
                   
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
        print(sites)
        if segue.identifier == "showCollection" {
          
            

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
