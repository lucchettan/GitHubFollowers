//
//  User.swift
//  GitHub Followers
//
//  Created by Nicolas Lucchetta on 16/02/2021.
//  Copyright © 2021 NLCompany. All rights reserved.
//

import Foundation

struct User: Codable {
    var login:      String
    var avatarUrl:  String
    var name:       String?
    var location:   String?
    var bio:        String?
    var publicRepos:Int
    var publicGists:Int
    var htmlUrl:    String
    var following:  Int
    var followers:  Int
    var createdAt:  Date
}
