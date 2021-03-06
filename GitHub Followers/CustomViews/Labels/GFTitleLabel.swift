//
//  GFTitleLabel.swift
//  GitHub Followers
//
//  Created by Nicolas Lucchetta on 16/02/2021.
//  Copyright © 2021 NLCompany. All rights reserved.
//

import UIKit

class GFTitleLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(textAlignment: NSTextAlignment, fontSize: CGFloat) {
        self.init(frame: .zero)
        self.textAlignment = textAlignment
        self.font = UIFont.systemFont(ofSize: fontSize, weight: .bold)
        configure()
    }
    
    private func configure(){
        textColor                                   = .label
        adjustsFontSizeToFitWidth                   = true
        minimumScaleFactor                          = 0.9
        //if username too long it will finish by "..."
        lineBreakMode                               = .byTruncatingTail
        translatesAutoresizingMaskIntoConstraints   = false
    }
}
