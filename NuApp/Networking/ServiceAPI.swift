//
//  ServiceAPI.swift
//  Pokedex
//
//  Created by Emiliano Alfredo Martinez Vazquez on 20/02/23.
//

import Foundation

extension URLSessionDataTask: URLSessionDataTaskProtocol {}

extension URLSession: URLSessionProtocol {
    func performDataTask(with request: URLRequest, completionHandler: @escaping DataTaskResult) -> URLSessionDataTaskProtocol {
        return dataTask(with: request, completionHandler: completionHandler) as URLSessionDataTaskProtocol
    }
}

class ServiceAPI: Service {
    let session: URLSessionProtocol
    
    init(session: URLSessionProtocol) {
        self.session = session
    }
    
    func get<T: Decodable>(_ endpoint: Endpoint, callback: @escaping (Result<T,Error>) -> Void) {
        let request = endpoint.request
        let task = session.performDataTask(with: request) { (data, response, error) in
            if let errors: Error = error {
                callback(.failure(errors))
                return
            }

            guard let data: Data = data else {
                callback(.failure(ServiceError.noData))
                return
            }
            
            
            guard let response: HTTPURLResponse = response as? HTTPURLResponse else {
                callback(.failure(ServiceError.response))
                return
            }
            
            guard (200 ... 299) ~= response.statusCode else {
                print("statusCode should be 2xx, but is \(response.statusCode)")
                print("response = \(response)")
                callback(.failure(ServiceError.internalServer))
                return
            }
            
            
            do {
                let decodedData: T = try JSONDecoder().decode(T.self, from: data)
                callback(.success(decodedData))
            } catch {
                callback(.failure(ServiceError.parsingData))
            }
        }
        task.resume()
    }

    func post<T: Codable>(_ endpoint: Endpoint, url: ResponseLink, callback: @escaping (Result<T,Error>) -> Void) {
        var request = endpoint.request
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        do {
            let data = try JSONEncoder().encode(url)
            request.httpBody = data
            request.setValue("\(data.count)", forHTTPHeaderField: "Content-Length")
        } catch {
            print("error")
        }

        request.httpMethod = "POST"

        let task = session.performDataTask(with: request) { (data, response, error) in
            if let errors: Error = error {
                callback(.failure(errors))
                return
            }

            guard let data: Data = data else {
                callback(.failure(ServiceError.noData))
                return
            }


            guard let response: HTTPURLResponse = response as? HTTPURLResponse else {
                callback(.failure(ServiceError.response))
                return
            }

            guard (200 ... 299) ~= response.statusCode else {
                print("statusCode should be 2xx, but is \(response.statusCode)")
                print("response = \(response)")
                callback(.failure(ServiceError.internalServer))
                return
            }


            do {
                let decodedData: T = try JSONDecoder().decode(T.self, from: data)
                callback(.success(decodedData))
            } catch {
                callback(.failure(ServiceError.parsingData))
            }
        }
        task.resume()
    }
}
