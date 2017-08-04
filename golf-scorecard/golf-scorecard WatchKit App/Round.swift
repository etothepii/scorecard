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
    var startTime: Date
    
    init(holes: Int) {
        self.holes = holes
        self.scoreCard = Array(repeating: 0, count: holes)
        self.hole = 0
        startTime = Date()
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
    
    func currentScore() -> Int {
        return self.scoreCard[self.hole]
    }
    
    func totalScore() -> Int {
        var total: Int = 0
        for score in self.scoreCard {
            total += score
        }
        return total
    }
    
}
