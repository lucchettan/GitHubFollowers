//
//  GFRepoItemVC.swift
//  GitHub Followers
//
//  Created by Nicolas Lucchetta on 21/02/2021.
//  Copyright © 2021 NLCompany. All rights reserved.
//

import UIKit

class GFRepoItemVC : GFItemInfoVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    private func configureItems() {
        itemInfoViewOne.set(itemInfoType: .repos, withCount: user.publicRepos)
        itemInfoViewTwo.set(itemInfoType: .gists, withCount: user.publicGists)
        actionButton.set(backgroundColor: .systemPurple, title: "GitHub Profile")
    }
    
    override func actionButtonTapped() {
        delegate.didTapGithubProfile(for: user)
    }
}
