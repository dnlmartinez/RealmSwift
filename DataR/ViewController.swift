//
//  ViewController.swift
//  DataR
//
//  Created by daniel martinez gonzalez on 5/7/16.
//  Copyright © 2016 daniel martinez gonzalez. All rights reserved.
//

import UIKit
import RealmSwift


class ViewController: UIViewController
{
    let realm = try! Realm()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool)
    {
        let QAirp = realm.objects(Airport.self)
        
        if QAirp.count > 0
        {
            self.performSegueWithIdentifier("NextSegue", sender: nil)
        }
        else
        {
            self.AddAirports()
        }
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func AddAirports()
    {
        let url : NSString = NSBundle.mainBundle().pathForResource("airports", ofType: "json")!
        let data : NSData = try! NSData(contentsOfFile: url as String, options: NSDataReadingOptions.DataReadingMapped)
        
        do
        {
            let object : NSArray = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments) as! NSArray
            
            for i in 0  ..< object.count
            {
                
                let Dict : NSDictionary = object.objectAtIndex(i) as! NSDictionary
                let oldID = i
                let oldName = Dict["name"] as! String
                let oldCode = Dict["code"] as! String
                var oldcurrency : String = ""
                let oldLongName = Dict["longName"] as! String
                let oldCity = Dict["city"] as! String
                var Delivery : Bool = false
                var active : Bool = false
                var DeliveryTax : String = "0.0"
                var DutyFree : String = "NOT"
                var activeDemo : Bool = false
                var deliveryDep : Bool = false
                var deliveryArr : Bool = false
                var infoStores : Bool = false
                
                if Dict["currencySymbol"] != nil
                {
                    oldcurrency = Dict["currencySymbol"] as! String
                }
                
                if Dict["delivery"] != nil
                {
                    Delivery = Dict["delivery"] as! Bool
                }
                
                if Dict["active"] != nil
                {
                    active = Dict["active"] as! Bool
                }
                
                if Dict["infoStores"] != nil
                {
                    infoStores = Dict["infoStores"] as! Bool
                }
                
                if Dict["dutyfree"] != nil
                {
                    let DictDuty = Dict["dutyfree"] as! NSDictionary
                    DutyFree = DictDuty["name"] as! String
                }
                
                if Dict["taxDelivery"] != nil
                {
                    DeliveryTax = Dict["taxDelivery"] as! String
                }
                
                if Dict["activeDemo"] != nil
                {
                    activeDemo = Dict["activeDemo"] as! Bool
                }
                
                if Dict["deliveryDeparture"] != nil
                {
                    deliveryDep = Dict["deliveryDeparture"] as! Bool
                }
                
                if Dict["deliveryArrival"] != nil
                {
                    deliveryArr = Dict["deliveryArrival"] as! Bool
                }
                
                if Dict["taxDelivery"] != nil
                {
                    DeliveryTax = Dict["taxDelivery"] as! String
                }

                
                let airport = Airport()
                airport.id = oldID
                airport.code = oldCode
                airport.name = oldName
                airport.longName = oldLongName
                airport.city = oldCity
                airport.currency = oldcurrency
                airport.delivery = Delivery
                airport.deliveryTax = DeliveryTax
                airport.dutyFree = DutyFree
                airport.deliveryDep = deliveryDep
                airport.deliveryArr = deliveryArr
                airport.active = active
                airport.activeDemo = activeDemo
                airport.infoStores = infoStores
                
                try! realm.write
                {
                        realm.add(airport , update: true)
                }
                
            }
        }
        catch
        {
            // Handle Error
        }
    }
}

