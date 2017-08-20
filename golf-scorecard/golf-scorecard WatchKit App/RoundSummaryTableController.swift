//
//  RoundSummaryTableController.swift
//  golf-scorecard
//
//  Created by James Robinson on 06/08/2017.
//  Copyright © 2017 James Robinson. All rights reserved.
//

import WatchKit
import WatchConnectivity

class RoundSummaryTableController: WKInterfaceController, WCSessionDelegate {
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        self.session = session
    }
    
    @IBOutlet var roundSummaryTable: WKInterfaceTable!
    var round: Round?
    
    var session: WCSession?
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        DispatchQueue.global(qos: .background).async {
            WCSession.default().delegate = self
            WCSession.default().activate()
        }
        guard let round = context as? Round else {
            return
        }
        setRound(round: round)
    }
    
    @IBAction func saveRound() {
        if let round = round, WCSession.isSupported() {
            let session = WCSession.default()
            do {
                try session.updateApplicationContext(["round":round.toDictionary()])
            }
            catch {
            }
        }
    }
    
    @IBAction func newRound() {
        if let round = round {
            round.reset()
        }
    }
    func setRound(round: Round) {
        self.round = round
        roundSummaryTable.setNumberOfRows(round.holes, withRowType: "summaryRow")
    }
    
    override func willActivate() {
        if let round = round {
            for holeIndex in 0..<round.holes {
                if let row = roundSummaryTable.rowController(at: holeIndex) as? HoleSummaryTableRowController {
                    row.setHoleScore(holeScore: round.scoreCard[holeIndex])
                }
            }
            self.setTitle("Score: \(round.totalScore())")
        }
        super.willActivate()
    }
}
