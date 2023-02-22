//
//  ServiceProtocols.swift
//  Pokedex
//
//  Created by  Emiliano Alfredo Martinez Vazquez on 20/02/23.
//

import Foundation

protocol Service {
    var session: URLSessionProtocol { get }
    func get<T: Decodable>(_ endpoint: Endpoint, callback: @escaping (Result<T,Error>) -> Void)
    func post<T: Codable>(_ endpoint: Endpoint, url: ResponseLink, callback: @escaping (Result<T,Error>) -> Void)
}

protocol URLSessionDataTaskProtocol {
    func resume()
}

protocol URLSessionProtocol { typealias DataTaskResult = (Data?, URLResponse?, Error?) -> Void
    func performDataTask(with request: URLRequest, completionHandler: @escaping DataTaskResult) -> URLSessionDataTaskProtocol
}
