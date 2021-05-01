//
//  GFTextField.swift
//  GitHub Followers
//
//  Created by Nicolas Lucchetta on 16/02/2021.
//  Copyright © 2021 NLCompany. All rights reserved.
//

import UIKit

class GFTextField: UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius        = 10
        layer.borderWidth         = 2
        layer.borderColor         = UIColor.systemGray4.cgColor
        textColor                 = .label
        tintColor                 = .label
        textAlignment             = .center
        font                      = UIFont.preferredFont(forTextStyle: .title2)
        minimumFontSize           = 12
        backgroundColor           = .tertiarySystemBackground
        autocorrectionType        = .no
        adjustsFontSizeToFitWidth = true
        placeholder               = "Enter a username"
        returnKeyType             = .go
        clearButtonMode           = .whileEditing
    }
}
