//
//  ViewControllerRead.swift
//  DataR
//
//  Created by daniel martinez gonzalez on 6/7/16.
//  Copyright © 2016 daniel martinez gonzalez. All rights reserved.
//

import UIKit
import RealmSwift

class ViewControllerRead: UIViewController
{
    
    @IBOutlet weak var LAbelContend: UILabel!
    @IBOutlet weak var LabelNumReg: UILabel!
    @IBOutlet weak var TextBox: UITextField!
    
    
    let realm = try! Realm()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func Press_Search(sender: AnyObject)
    {
    
        let Cad : String = self.TextBox.text!
        
        let Predicate : String = String.localizedStringWithFormat("code CONTAINS '%@' || name CONTAINS '%@' || longName CONTAINS '%@' || city CONTAINS '%@'", Cad , Cad , Cad , Cad)
        
        let QAirp = realm.objects(Airport.self).filter(Predicate)
        
        self.LabelNumReg.text = String.localizedStringWithFormat("Num Reg== %i", QAirp.count)
        self.LAbelContend.text = String.localizedStringWithFormat("%@", QAirp)
    
    }
    

}