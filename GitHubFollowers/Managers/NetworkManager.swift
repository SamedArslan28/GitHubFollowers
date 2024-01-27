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
    
    func getFollowers(for username: String, page:Int, completion: @escaping (Result<[Follower], GFError>) -> ()){
        let endPoint = baseUrl + "\(username)/followers?per_page=100&page=\(page)"
        guard let url = URL(string: endPoint) else {
            completion(.failure(.invalidUsername))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completion(.failure(.noInternet))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.badRequest))
                return
            }
            
            guard let data = data else{
                completion(.failure(.invalidData))
                return
            }
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Follower].self, from: data)
                completion(.success(followers))
            } catch  {
                completion(.failure(.invalidData))
            }
        }
        task.resume()
    }
}
