//
//  CoreDataSuporter.swift
//  CoreDataTutorial
//
//  Created by Baran on 5.12.2017.
//  Copyright © 2017 Brainilission. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class CoreDataSupporter {
    
    class func addProduct(product: ProductStructure){
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        do {
            if fetchToBag() != nil {
                var productExistsKey = false
                for item in fetchToBag()! {
                    if item.id == product.id {
                        productExistsKey = true
                    }
                }
                if productExistsKey {
                    print("this product already exists")
                }
                else{
                    let newProduct = NSEntityDescription.insertNewObject(forEntityName: "Product", into: context)
                    newProduct.setValue(product.category_id, forKey: "category_id")
                    newProduct.setValue(product.desc, forKey: "desc")
                    newProduct.setValue(product.id, forKey: "id")
                    newProduct.setValue(product.name, forKey: "name")
                    newProduct.setValue(product.price, forKey: "price")
                    newProduct.setValue(product.time, forKey: "time")
                    try context.save()
                    print("Product Saved Core Data")
                }
            }
            else{
                let newProduct = NSEntityDescription.insertNewObject(forEntityName: "Product", into: context)
                newProduct.setValue(product.category_id, forKey: "category_id")
                newProduct.setValue(product.desc, forKey: "desc")
                newProduct.setValue(product.id, forKey: "id")
                newProduct.setValue(product.name, forKey: "name")
                newProduct.setValue(product.price, forKey: "price")
                newProduct.setValue(product.time, forKey: "time")
                try context.save()
                print("Product Saved Core Data")
            }
            
        } catch {
            print("ERROR! Saved")
            //Process error
        }
    }
    
    class func fetchToBag() -> [ProductStructure]?{
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Product")
        request.returnsObjectsAsFaults = false
        
        do {
            let results = try context.fetch(request)
            if results.count > 0 {
                var productList = [ProductStructure]()
                for result in results as! [NSManagedObject] {
                    var product = ProductStructure()
                    if let id = result.value(forKey: "id") as? String {
                        product.id = id
                    }
                    if let category_id = result.value(forKey: "category_id") as? String {
                        product.category_id = category_id
                    }
                    if let desc = result.value(forKey: "desc") as? String {
                        product.desc = desc
                    }
                    if let name = result.value(forKey: "name") as? String {
                        product.name = name
                    }
                    if let price = result.value(forKey: "price") as? String {
                        product.price = price
                    }
                    if let time = result.value(forKey: "time") as? String {
                        product.time = time
                    }
                    productList.append(product)
                }
                return productList
            }
        } catch {
            print("ERROR! Saved")
            //Process error
        }
        return nil
    }
    
    class func removeAllData(){
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Product")
        request.returnsObjectsAsFaults = false
        
        do {
            if let result = try? context.fetch(request) {
                for object in result {
                    context.delete(object as! NSManagedObject)
                }
                do {
                    try context.save()
                    print("saved!")
                } catch let error as NSError  {
                    print("Could not save \(error), \(error.userInfo)")
                } catch {
                    
                }
            }
        } catch {
            print("ERROR! Removed")
            //Process error
        }
    }
    
    class func removeSelectedData(objectID: String){
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Product")
        request.returnsObjectsAsFaults = false
        
        do {
            let results = try context.fetch(request)
            if results.count > 0 {
                for result in results as! [NSManagedObject] {
                    if let id = result.value(forKey: "id") as? String {
                        if id == objectID {
                            context.delete(result)
                            
                            do {
                                try context.save()
                                print("saved!")
                            } catch let error as NSError  {
                                print("Could not save \(error), \(error.userInfo)")
                            } catch {
                                
                            }
                            print("Delete selected object")
                        }
                        else{
                            print("Error delete object")
                        }
                    }
                }
            }
        } catch {
            
        }
    }
    
    
    
}

struct ProductStructure {
    var category_id = ""
    var desc = ""
    var id = ""
    var name = ""
    var price = ""
    var time = ""
}

