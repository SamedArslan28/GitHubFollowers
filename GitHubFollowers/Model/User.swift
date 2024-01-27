//
//  User.swift
//  GitHubFollowers
//
//  Created by Abdulsamed Arslan on 27.01.2024.
//

import Foundation

struct User: Codable{
    var login: String
    var avatarUrl: String
    var name: String?
    var location: String?
    var bio: String?
    var publicRepos: Int
    var publicGists: Int
    var htmlUrls: String
    var followers: Int
    var following: Int
    var createdAt: String
}
