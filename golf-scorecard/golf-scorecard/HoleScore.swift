//
//  HoleScore.swift
//  golf-scorecard
//
//  Created by James Robinson on 04/08/2017.
//  Copyright © 2017 James Robinson. All rights reserved.
//

import UIKit

class HoleScore {
    
    var strokesToGreen: Int
    var strokesOnGreen: Int
    var landedOnGreen: Bool
    var completed: Bool
    
    init() {
        self.strokesToGreen = 0
        self.strokesOnGreen = 0
        self.landedOnGreen = false
        self.completed = false
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
    
    func completeHole() {
        completed = true
    }
    
    func landOnGreen() {
        landedOnGreen = true
    }

}
