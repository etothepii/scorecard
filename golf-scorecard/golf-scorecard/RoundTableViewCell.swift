//
//  RoundTableViewCell.swift
//  golf-scorecard
//
//  Created by James Robinson on 13/08/2017.
//  Copyright © 2017 James Robinson. All rights reserved.
//

import UIKit

class RoundTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBOutlet var name: UILabel!
    @IBOutlet var score: UILabel!

    func setRound(round: Round) {
        name.text = round.name
        score.text = "\(round.totalScore())"
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
