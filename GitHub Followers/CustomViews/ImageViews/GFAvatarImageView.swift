//
//  GFAvatarImageView.swift
//  GitHub Followers
//
//  Created by Nicolas Lucchetta on 16/02/2021.
//  Copyright © 2021 NLCompany. All rights reserved.
//

import UIKit

class GFAvatarImageView: UIImageView {
    let placeholderImage = Images.placeholder
    let cache            = NetworkManager.shared.cache
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        layer.cornerRadius  = 10
        clipsToBounds       = true
        image               = placeholderImage
        translatesAutoresizingMaskIntoConstraints = false
    }
}
