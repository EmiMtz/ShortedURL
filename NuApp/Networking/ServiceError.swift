//
//  ServiceError.swift
//  Pokedex
//
//  Created by  Emiliano Alfredo Martinez Vazquez on 20/02/23.
//

import Foundation

enum ServiceError: Error {
    case noData
    case response
    case parsingData
    case internalServer
    case userNoExist
}
