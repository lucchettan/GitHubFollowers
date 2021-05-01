//
//  GFError.swift
//  GitHub Followers
//
//  Created by Nicolas Lucchetta on 21/02/2021.
//  Copyright © 2021 NLCompany. All rights reserved.
//

import Foundation

enum GFError: String, Error {
    case invalidUsername    = "This username created an invalid request. Please try again."
    case unableToComplete   = "Unable to complete your request. Please check internet connexion"
    case invalidResponse    = "Invalid response from the server. Please try again"
    case dataInvalid        = "The data received from the server is invalid. Please try again."
    case unableToFavorite   = "There was an error favoriting this user. Please try again."
    case alreadyFavorited   = "You have already favorited this user. You must really like them."
}
