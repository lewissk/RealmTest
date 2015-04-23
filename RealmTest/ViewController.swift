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
        var challenges = Challenge.objectsWithPredicate(predicate)
        
        if challenges == nil || challenges.count == 0 {
            let tcChallenge = TotalCountChallenge()
            tcChallenge.title = "Booya Total Count Challenge"
            tcChallenge.totalCountGoal = 1_000_000
            
            let rChallenge = RecurringChallenge()
            rChallenge.title = "Booya Recurring Challenge"
            rChallenge.recurranceType = .Weekly
            rChallenge.totalCountGoal = 2_000_000
            
            let realm = RLMRealm.defaultRealm()
            // You only need to do this once (per thread)
        
            // Add to the Realm inside a transaction
            realm.beginWriteTransaction()
            realm.addObject(tcChallenge)
            realm.addObject(rChallenge)
            realm.commitWriteTransaction()
        }
        
        challenges = Challenge.objectsWithPredicate(predicate)
        if challenges != nil && challenges.count > 0 {
            for challenge in challenges {
                let c = challenge as! Challenge
                println("\(c.title)")
            }
        } else {
            println("No Challenges found")
        }
        
        challenges = TotalCountChallenge.objectsWithPredicate(predicate)
        if challenges != nil && challenges.count > 0 {
            for challenge in challenges {
                let c = challenge as! Challenge
                println("TotalCountChallenge: \(c.title)")
            }
        } else {
            println("No Total Count Challenges found")
        }
        
        challenges = RecurringChallenge.objectsWithPredicate(predicate)
        if challenges != nil && challenges.count > 0 {
            for challenge in challenges {
                let c = challenge as! Challenge
                println("RecurringChallenge \(c.title)")
            }
        } else {
            println("No Recurring Challenges found")
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

