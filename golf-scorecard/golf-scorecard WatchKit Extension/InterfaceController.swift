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
        round.add()
        updateLabels()
    }
    @IBAction func swipeRight(_ sender: Any) {
        round.previousHole()
        updateLabels()
    }
    @IBAction func swipeLeft(_ sender: Any) {
        round.nextHole()
        updateLabels()
    }
    @IBOutlet var scoreLabel: WKInterfaceLabel!
    @IBOutlet var holeLabel: WKInterfaceLabel!
    
    func updateLabels() {
        holeLabel.setText("Hole \(round.hole + 1)")
        scoreLabel.setText("\(round.currentScore())")
    }
}
