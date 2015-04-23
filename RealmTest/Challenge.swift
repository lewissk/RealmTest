//
//  Challenge.swift
//  RealmTest
//
//  Created by Bret Smith on 4/23/15.
//  Copyright (c) 2015 Exemine. All rights reserved.
//

import Realm

@objc enum RecurrenceEnum : Int {
    case Daily = 1
    case Weekly = 2
    case Monthly = 3
}

class Challenge: RLMObject {
    dynamic var title = ""
}

class TotalCountChallenge: Challenge {
    dynamic var totalCountGoal: Int = 0
}

class RecurringChallenge: Challenge {
    dynamic var recurranceType: RecurrenceEnum = .Daily
    dynamic var totalCountGoal: Int = 0
}