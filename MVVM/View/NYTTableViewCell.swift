//
//  NYTTableViewCell.swift
//  NYTimes
//
//  Created by Abdul on 22/06/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
class NYTTableViewCell: UITableViewCell {

    @IBOutlet weak var naviGateImg: UIImageView!
     @IBOutlet weak var previewImg: UIImageView!
     @IBOutlet weak var titleLbl: UILabel!
     @IBOutlet weak var detailLbl: UILabel!
     @IBOutlet weak var timeVal: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
