//
//  GFFollowerItemVC.swift
//  GitHub Followers
//
//  Created by Nicolas Lucchetta on 21/02/2021.
//  Copyright © 2021 NLCompany. All rights reserved.
//

import UIKit
// inherit all the methods of GFItemInfoVC

class GFFollowerItemVC: GFItemInfoVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    private func configureItems() {
        itemInfoViewOne.set(itemInfoType: .followers, withCount: user.followers)
        itemInfoViewTwo.set(itemInfoType: .following, withCount: user.following)
        actionButton.set(backgroundColor: .systemGreen, title: "Get Followers")
    }
    
    override func actionButtonTapped() {
        delegate.didTapGetFollowers(for: user)
    }
}
