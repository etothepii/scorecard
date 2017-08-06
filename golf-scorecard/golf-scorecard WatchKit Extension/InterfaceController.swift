//
//  InterfaceController.swift
//  golf-scorecard WatchKit Extension
//
//  Created by James Robinson on 04/08/2017.
//  Copyright © 2017 James Robinson. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    var round: Round
    var rounds: [Round]
    
    override init() {
        self.round = Round(holes: 18)
        self.rounds = [round]
        super.init()
    }
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        updateLabels()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func longPress(_ sender: Any) {
        round = Round(holes: 18)
        rounds += [round]
        updateLabels()
    }
    @IBAction func tap(_ sender: Any) {
        if (!self.round.completedHole()) {
            round.addStroke()
            updateLabels()
        }
    }
    @IBAction func buttonClicked() {
        if (self.round.completedHole()) {
            round.nextHole()
        }
        else {
            if (self.round.landedOnGreen()) {
                round.completeHole()
            }
            else {
                round.landOnGreen()
            }
        }
        updateLabels()
    }
    
    @IBOutlet var scoreLabel: WKInterfaceLabel!
    @IBOutlet var button: WKInterfaceButton!
    
    func updateLabels() {
        self.setTitle("Hole \(round.hole + 1)")
        scoreLabel.setText("\(round.currentScore())")
        if (self.round.completedHole()) {
            self.button.setTitle("Next Hole")
        }
        else {
            if (self.round.landedOnGreen()) {
                self.button.setTitle("In Hole")
            }
            else {
                self.button.setTitle("On Green")
            }
        }
    }
}
