//
//  StructData.swift
//  DataR
//
//  Created by daniel martinez gonzalez on 6/7/16.
//  Copyright © 2016 daniel martinez gonzalez. All rights reserved.
//

import Foundation
import RealmSwift
import UIKit

class Airport: Object
{
    dynamic var id = 0
    dynamic var code = ""
    dynamic var name = ""
    dynamic var longName = ""
    dynamic var city = ""
    dynamic var currency = ""
    dynamic var delivery = false
    dynamic var deliveryTax = ""
    dynamic var dutyFree = ""
    dynamic var deliveryDep = false
    dynamic var deliveryArr = false
    dynamic var active = false
    dynamic var activeDemo = false
    dynamic var infoStores = false
    
    override static func primaryKey() -> String?
    {
        return "id"
    }
}
