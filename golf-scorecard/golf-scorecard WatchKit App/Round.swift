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
    var scoreCard: [HoleScore]
    var hole: Int
    
    init(dictionary: [String: Any]) {
        self.holes = dictionary["holes"] as! Int
        self.hole = dictionary["hole"] as! Int
        self.scoreCard = [HoleScore]()
        for scoreCardDictionary in (dictionary["scoreCard"] as! [Any]) {
            self.scoreCard += [HoleScore(dictionary: scoreCardDictionary as! [String: Any])]
        }
    }
    
    init(holes: Int) {
        self.holes = holes
        self.scoreCard = [HoleScore]()
        for holeIndex in 0..<holes {
            self.scoreCard += [HoleScore(hole: Hole(number: holeIndex + 1, name: "Hole \(holeIndex + 1)"))]
        }
        self.hole = 0
    }
    
    func reset() {
        self.scoreCard = [HoleScore]()
        for holeIndex in 0..<holes {
            self.scoreCard += [HoleScore(hole: Hole(number: holeIndex + 1, name: "Hole \(holeIndex + 1)"))]
        }
        self.hole = 0
    }
    
    func completedHole() -> Bool {
        return self.scoreCard[hole].completed
    }
    
    func addStroke() {
        scoreCard[hole].addStroke()
    }
    
    func removeStroke() {
        scoreCard[hole].removeStroke()
    }
    
    func landOnGreen() {
        scoreCard[hole].landOnGreen()
    }
    
    func completeHole() {
        scoreCard[hole].completeHole()
    }
    
    func lastHole() -> Bool {
        return self.hole == self.holes - 1
    }
    
    func nextHole() {
        hole += 1
        if (hole >= holes) {
            hole = 0
        }
    }
    
    func landedOnGreen() -> Bool {
        return scoreCard[hole].landedOnGreen
    }
    
    func previousHole() {
        hole -= 1
        if (hole < 0) {
            hole = holes - 1
        }
    }
    
    func currentScore() -> Int {
        return self.scoreCard[self.hole].totalStrokes()
    }
    
    func totalScore() -> Int {
        var total: Int = 0
        for score in self.scoreCard {
            total += score.totalStrokes()
        }
        return total
    }
    
    func totalToGreen() -> Int {
        var total: Int = 0
        for score in self.scoreCard {
            total += score.strokesToGreen
        }
        return total
    }
    
    func totalOnGreen() -> Int {
        var total: Int = 0
        for score in self.scoreCard {
            total += score.strokesOnGreen
        }
        return total
    }
    
    func toDictionary() -> [String: Any] {
        var scoreCardArray = [[String: Any]]()
        for score in scoreCard {
            scoreCardArray += [score.toDictionary()]
        }
        return ["hole": hole,
        "holes": holes,
        "scoreCard": scoreCardArray]
    }
    
}
