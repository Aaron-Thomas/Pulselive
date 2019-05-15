//
//  RoundedUIView.swift
//  Pulselive
//
//  Created by Aaron Thomas on 01/05/2019.
//  Copyright © 2019 InteractiveCode. All rights reserved.
//

import UIKit

class RoundedUIView: UIView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.cornerRadius = 20
        layer.borderWidth = 1.0
        layer.borderColor = UIColor.lightGray.cgColor
        
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.shadowOpacity = 1.0
        layer.shadowRadius = 2.0
        layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        layer.masksToBounds = false
    }
}
