//
//  NetworkManager.swift
//  GitHubFollowers
//
//  Created by Abdulsamed Arslan on 27.01.2024.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    let baseUrl = "https://api.github.com/users/"
    private init() { }
    
    func getFollowers(for username: String, page:Int, completion: @escaping ([Follower]?, String?) -> ()){
        let endPoint = baseUrl + "\(username)/followers?per_page=100&page=\(page)"
        guard let url = URL(string: endPoint) else {
            completion(nil, "That request is not valid please try again.")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completion(nil, "No Internet")
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(nil, "Bad request")
                return
            }
            
            guard let data = data else{
                completion(nil, "Data is invalid")
                return
            }
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Follower].self, from: data)
                completion(followers, nil)
            } catch  {
                completion(nil, "Data is invalid")
            }
        }
        task.resume()
    }
}
