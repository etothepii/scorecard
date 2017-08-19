//
//  Hole.swift
//  golf-scorecard
//
//  Created by James Robinson on 04/08/2017.
//  Copyright © 2017 James Robinson. All rights reserved.
//

import UIKit

class Hole {
    
    var number: Int
    var name: String
    
    init(number: Int, name: String) {
        self.number = number
        self.name = name
    }
    
    func toDictionary() -> [String: Any] {
        return ["number":number,"name":name]
    }
    
    init(dictionary: [String: Any]) {
        self.number = dictionary["number"] as! Int
        self.name = dictionary["name"] as! String
    }
    
}
