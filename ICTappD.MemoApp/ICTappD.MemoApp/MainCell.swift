//
//  MainCell.swift
//  ICTappD.MemoApp
//
//  Created by student02 on 2018. 6. 1..
//  Copyright © 2018년 student02. All rights reserved.
//
//Why Label? we are just showing the text. That's why
import UIKit

class MainCell: UITableViewCell {
    
    @IBOutlet weak var TitleLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
