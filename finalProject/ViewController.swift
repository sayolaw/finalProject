//
//  ViewController.swift
//  finalProject
//
//  Created by Sayo Lawal on 2022-05-25.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var managedContext:NSManagedObjectContext!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        

        managedContext = appDelegate.persistentContainer.viewContext
        
    }


}

