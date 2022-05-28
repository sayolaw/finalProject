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
    //    private var dataSource : [Ste] = [ Site(image: "Bodrum.jpg", name: "Ankara",latitude: 23.3367,longitude: 50.6577),
    //                                        Site(image: "Antalya.jpg", name: "Antalya",latitude: 39.3367,longitude: 70.6577),
    //                                        Site(image: "Aydin.jpg", name: "Aydin",latitude: 42.3367,longitude: -64.6577),
    //                                        Site(image: "Bodrum.jpg", name: "Bodrum",latitude: 43.64,longitude: -79.38),
    //                                        Site(image: "Canakkale.jpg", name: "Canakkale",latitude: 42.3367,longitude: 66.6577),
    //
    var sites = [Site]()
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var managedContext:NSManagedObjectContext!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
//        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource
//    private func appendBook(name:String, latitude: Double, longitude: Double){
//        let book = Site(context: managedContext)
//        book.name = name
//        book.latitude = Double(latitude)
//        book.longitude = Double(pages)
//        book.year = Int16(year)
//        books.append(book)
//
//    }
//    @objc func saveCoreData(){
//     clearCoreData()
//        for book in books{
//            let bookEntity = NSEntityDescription.insertNewObject(forEntityName: "Book", into: managedContext)
//            bookEntity.setValue(book.title, forKey: "title")
//            bookEntity.setValue(book.author, forKey: "author")
//            bookEntity.setValue(book.pages, forKey: "pages")
//            bookEntity.setValue(book.year, forKey: "year")
//
//        }
//        appDelegate.saveContext()
//    }
//    func loadCoreData(){
//        sites = [Site]()
//        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Site")
//        do{
//            let results = try managedContext.fetch(fetchRequest)
//            if results is [NSManagedObject]{
//                for result in (results as! [NSManagedObject]){
//                    let title = result.value(forKey: "title") as! String
//                    let latitude = result.value(forKey: "latitude") as! Double
//                    let longitude = result.value(forKey: "longitude") as! Double
//                   appendSite(title: title, latitude: latitude, longitude: longitude)
//                }
//            }
//        } catch{
//            print(error)
//        }
//    }
//    func clearCoreData(){
//        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Book")
//        do{
//            let results = try managedContext.fetch(fetchRequest)
//                for result in (results as! [NSManagedObject]){
//                    if let managedObject = result as? NSManagedObject{
//                        managedContext.delete(managedObject)
//                }
//            }
//        } catch{
//            print(error)
//        }
//    }
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
//    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//            performSegue(withIdentifier: "showDetail", sender: nil)
//        }
    @IBAction func unwindToMain(segue: UIStoryboardSegue){
           
       }
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
