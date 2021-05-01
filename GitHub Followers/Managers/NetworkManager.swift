//
//  NetworkManager.swift
//  GitHub Followers
//
//  Created by Nicolas Lucchetta on 16/02/2021.
//  Copyright © 2021 NLCompany. All rights reserved.
//

import UIKit

class NetworkManager {
    // to create an instance of the singleton and do it only once
    static let shared   = NetworkManager()
    private let baseURL = "https://api.github.com/users/"
    let cache           = NSCache<NSString, UIImage>()
    
    private init (){}
    // either we get back an array or an error
    func getFollowers(for username: String, page: Int, completed: @escaping (Result<[Follower], GFError>) -> Void) {
        let endPoint   = baseURL + "\(username)/followers?per_page=100&\(page)"
        
        guard let url = URL(string: endPoint) else {
            completed(.failure(.invalidUsername))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            // is the response nil? - let it be response - if response check status code http code ( 200 = ok)
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.dataInvalid))
                return
            }
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase //pass from snakecase to CamelCase to fit our model variables
                let followers = try decoder.decode([Follower].self, from: data)
                completed(.success(followers))
            } catch {
                completed(.failure(.dataInvalid))
            }
        }
        // Trigger the task that has been set.
        task.resume()
    }
    
    
    
    func getUserInfo(for username: String, completed: @escaping (Result<User, GFError>) -> Void){
        let endPoint   = baseURL + "\(username)"
        
        guard let url = URL(string: endPoint) else {
            completed(.failure(.invalidUsername))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            // is the response nil? - let it be response - if response check status code http code ( 200 = ok)
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            guard let data = data else {
                completed(.failure(.dataInvalid))
                return
            }
            do {
                let decoder                  = JSONDecoder()
                decoder.keyDecodingStrategy  = .convertFromSnakeCase //pass from snakecase to CamelCase to fit our model variables
                decoder.dateDecodingStrategy = .iso8601
                let user                     = try decoder.decode(User.self, from: data)
                completed(.success(user))
            } catch {
                completed(.failure(.dataInvalid))
            }
        }
        // Trigger the task that has been set.
        task.resume()
    }
    
    
    func dowloadImage(from urlString: String, completed: @escaping (UIImage?) -> Void) {
        let cacheKey = NSString(string: urlString)
        
        // Check if we have the 'cache' image already
        if let image = cache.object(forKey: cacheKey) {
            completed(image)
            return
        }
        
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self,
                  error == nil,
                  let response = response as? HTTPURLResponse, response.statusCode == 200,
                  let data = data,
                  let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            // set the image in the cache
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
        }
        task.resume()
    }
}
