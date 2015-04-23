//
//  Challenge.swift
//  RealmTest
//
//  Created by Bret Smith on 4/23/15.
//  Copyright (c) 2015 Exemine. All rights reserved.
//

import Realm

class Challenge: RLMObject {
    dynamic var title = ""
}

class TotalCountChallenge: Challenge {
    dynamic var totalCountGoal: Int = 0
}
