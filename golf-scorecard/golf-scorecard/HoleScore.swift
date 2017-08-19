//
//  HoleScore.swift
//  golf-scorecard
//
//  Created by James Robinson on 04/08/2017.
//  Copyright © 2017 James Robinson. All rights reserved.
//

import UIKit

class HoleScore {
    
    var hole: Hole
    var strokesToGreen: Int
    var strokesOnGreen: Int
    var landedOnGreen: Bool
    var completed: Bool
    
    init(hole: Hole) {
        self.hole = hole
        self.strokesToGreen = 0
        self.strokesOnGreen = 0
        self.landedOnGreen = false
        self.completed = false
    }
    
    init(dictionary: [String: Any]) {
        self.hole = Hole(dictionary: dictionary["hole"] as! [String:Any])
        self.strokesOnGreen = dictionary["strokesOnGreen"] as! Int
        self.strokesToGreen = dictionary["strokesToGreen"] as! Int
        self.landedOnGreen = dictionary["landedOnGreen"] as! Bool
        self.completed = dictionary["completed"] as! Bool
    }
    
    func totalStrokes() -> Int {
        return strokesOnGreen + strokesToGreen
    }
    
    func addStroke() {
        if (landedOnGreen) {
            strokesOnGreen += 1
        }
        else {
            strokesToGreen += 1
        }
    }
    
    func removeStroke() {
        if (completed) {
            completed = false
        }
        else if (strokesOnGreen > 0) {
            strokesOnGreen -= 1
        }
        else if (strokesOnGreen == 0 && landedOnGreen) {
            landedOnGreen = false
        }
        else if (strokesToGreen > 0) {
            strokesToGreen -= 1
        }
    }
    
    func completeHole() {
        completed = true
    }
    
    func landOnGreen() {
        landedOnGreen = true
    }
    
    func toDictionary() -> [String: Any] {
        return ["hole": hole.toDictionary(),
                "strokesToGreen":strokesToGreen,
                "strokesOnGreen":strokesOnGreen,
                "landedOnGreen": landedOnGreen,
                "completed": completed]
    }

}
