//
//  ViewController.swift
//  RealmTest
//
//  Created by Bret Smith on 4/23/15.
//  Copyright (c) 2015 Exemine. All rights reserved.
//

import UIKit
import Realm

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Query using an NSPredicate object
        let predicate = NSPredicate(format: "title BEGINSWITH %@", "Booya")
        var challenges = TotalCountChallenge.objectsWithPredicate(predicate)
        
        if challenges == nil || challenges.count == 0 {
            let challenge = TotalCountChallenge()
            challenge.title = "Booya Challenge"
            challenge.totalCountGoal = 1_000_000
            
            let realm = RLMRealm.defaultRealm()
            // You only need to do this once (per thread)
        
            // Add to the Realm inside a transaction
            realm.beginWriteTransaction()
            realm.addObject(challenge)
            realm.commitWriteTransaction()
        } else {
            let challenge: TotalCountChallenge! = challenges[0] as! TotalCountChallenge
            println("\(challenge.title) \(challenge.totalCountGoal)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

