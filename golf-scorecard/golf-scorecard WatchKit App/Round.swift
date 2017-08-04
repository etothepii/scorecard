//
//  Round.swift
//  golf-scorecard
//
//  Created by James Robinson on 04/08/2017.
//  Copyright © 2017 James Robinson. All rights reserved.
//

import Foundation

class Round {
    
    var holes: Int
    var scoreCard: [Int]
    var hole: Int
    
    init(holes: Int) {
        self.holes = holes
        self.scoreCard = Array(repeating: 0, count: holes)
        self.hole = 0
    }
    
    func reset() {
        self.scoreCard = Array(repeating: 0, count: holes)
        self.hole = 0
    }
    
    func add() {
        scoreCard[hole] += 1
    }
    
    func nextHole() {
        hole += 1
        if (hole >= holes) {
            hole = 0
        }
    }
    
    func previousHole() {
        hole -= 1
        if (hole < 0) {
            hole = holes - 1
        }
    }
    
}
