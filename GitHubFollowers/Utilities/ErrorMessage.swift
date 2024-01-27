//
//  ErrorMessage.swift
//  GitHubFollowers
//
//  Created by Abdulsamed Arslan on 27.01.2024.
//

import Foundation

enum GFError: String, Error {
    case invalidUsername = "That request is not valid please try again."
    case noInternet = "No Internet"
    case badRequest = "Bad request"
    case invalidData = "Data is invalid"
    case wrongUsername = "Wrong Username"
}
