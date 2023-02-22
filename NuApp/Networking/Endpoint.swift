//
//  Endpoint.swift
//  Pokedex
//
//  Created by Emiliano Alfredo Martinez Vazquez on 20/02/23.
//

import Foundation

enum Endpoint {
    static let baseURL = "https://url-shortener-server.onrender.com"
    
    case shortenURL
    case readShortenURL(id: String)
}

extension Endpoint {
    var string: String {
        switch self {
        case .shortenURL:
            return "/api/alias"
        case let .readShortenURL(id):
            return "/api/alias/\(id)"
        }
    }
    
    var request: URLRequest {
        let url: URL = URL(string: Endpoint.baseURL + string) ?? URL(fileURLWithPath: "")
        var request = URLRequest(url: url)

        switch self {
        case .shortenURL:
            request.setValue("url-shortener-server.onrender.com", forHTTPHeaderField: "Host")
            return request
        case .readShortenURL:
            request.httpMethod = "GET"
            return request
        }
    }
}
