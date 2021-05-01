//
//  PersistenceManager.swift
//  GitHub Followers
//
//  Created by Nicolas Lucchetta on 22/02/2021.
//  Copyright © 2021 NLCompany. All rights reserved.
//

import Foundation

enum PersistenceActionType {
    case add, remove
}

enum PersistenceManager {
    static private let defaults = UserDefaults.standard
    
    enum Keys {
        static let favorites = "favorites"
    }
    
    static func updateWith(favorite: Follower, actionType: PersistenceActionType, completed: @escaping (GFError?) -> Void){
        retrieveFavorites { result in
            switch result {
            case .success(let favorites):
                var retrievedFavorites = favorites
                
                switch actionType {
                case .add:
                    guard !retrievedFavorites.contains(favorite) else {
                        completed(.alreadyFavorited)
                        return
                    }
                    retrievedFavorites.append(favorite)
                case .remove:
                    // remove any instance.login that is equal to favorite.login
                    retrievedFavorites.removeAll { $0.login == favorite.login }
                }
                completed(save(favorites: retrievedFavorites))
                
            case .failure(let error):
                completed(error)
            }
        }
    }
    
    static func retrieveFavorites(completed: @escaping (Result<[Follower], GFError>) -> Void){
        guard let favoritesDatas = defaults.object(forKey: Keys.favorites) as? Data else {
            completed(.success([]))
            return
        }
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase //pass from snakecase to CamelCase to fit our model variables
            let favorites = try decoder.decode([Follower].self, from: favoritesDatas)
            completed(.success(favorites))
        } catch {
            completed(.failure(.unableToFavorite))
        }
    }
    
    static func save(favorites: [Follower]) -> GFError? {
        do {
            let encoder = JSONEncoder()
            let encodedFavorites = try encoder.encode(favorites)
            defaults.set(encodedFavorites, forKey: Keys.favorites)
            return nil
        } catch {
            return .unableToFavorite
        }
    }
}
