//
//  HumanData.swift
//  Macster
//
//  Created by Oleg Sulyanov on 05/07/2017.
//  Copyright © 2017 Oleg Sulyanov. All rights reserved.
//

import Foundation
import RealmSwift

class PersonalityData: Object {
    dynamic var name = ""
    
    override static func primaryKey() -> String {
        return "name"
    }
}
