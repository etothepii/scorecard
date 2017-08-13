//
//  HoleScoreTableViewCell.swift
//  golf-scorecard
//
//  Created by James Robinson on 13/08/2017.
//  Copyright © 2017 James Robinson. All rights reserved.
//

import UIKit

class HoleScoreTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet var score: UILabel!
    @IBOutlet var name: UILabel!
    
    func setHoleScore(holeScore: HoleScore) {
        name.text = holeScore.hole.name
        score.text = "\(holeScore.totalStrokes())"
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}