//
//  NewsTBVCell.swift
//  DesignPatternImpApp
//
//  Created by SMIT iMac27 on 19/03/20.
//  Copyright © 2020 SMIT iMac27. All rights reserved.
//

import UIKit

class NewsTBVCell: UITableViewCell {

    @IBOutlet weak var lblNewsDesc: UILabel!
    @IBOutlet weak var lblHeadline: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configurNewsList(newsJob:NewsViewModel) {
        lblHeadline.text = newsJob.name
        lblNewsDesc.text = newsJob.descriptions
        
    }

}
