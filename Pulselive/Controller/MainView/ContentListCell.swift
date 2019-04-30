//
//  ContentListCell.swift
//  Pulselive
//
//  Created by Aaron Thomas on 30/04/2019.
//  Copyright © 2019 InteractiveCode. All rights reserved.
//

import UIKit

class ContentListCell: UITableViewCell {
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var subtitleLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configureCell(listItem: ContentListItem) {
        titleLbl.text = listItem.title
        subtitleLbl.text = listItem.subtitle
        dateLbl.text = listItem.date
    }
}
