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

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func longPress(_ sender: Any) {
    }
    @IBAction func tap(_ sender: Any) {
    }
    @IBAction func swipeRight(_ sender: Any) {
    }
    @IBAction func swipeLeft(_ sender: Any) {
    }
    @IBOutlet var scoreLabel: WKInterfaceLabel!
    @IBOutlet var holeLabel: WKInterfaceLabel!
}
