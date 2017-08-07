//
//  HoleSummaryTableRowController.swift
//  golf-scorecard
//
//  Created by James Robinson on 06/08/2017.
//  Copyright © 2017 James Robinson. All rights reserved.
//

import WatchKit

class HoleSummaryTableRowController: NSObject {
    
    @IBOutlet var name: WKInterfaceLabel!
    @IBOutlet var throughGreen: WKInterfaceLabel!
    @IBOutlet var onGreen: WKInterfaceLabel!
    @IBOutlet var totalStrokes: WKInterfaceLabel!
    
    func setHoleScore(holeScore: HoleScore) {
        name.setText("\(holeScore.hole.number):")
        throughGreen.setText("\(holeScore.strokesToGreen)")
        onGreen.setText("\(holeScore.strokesOnGreen)")
        totalStrokes.setText("\(holeScore.totalStrokes())")
    }
    
}
