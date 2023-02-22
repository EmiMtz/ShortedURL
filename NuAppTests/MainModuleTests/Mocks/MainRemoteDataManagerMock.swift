//
//  MainRemoteDataManagerMock.swift
//  NuAppTests
//
//  Created by Emiliano Alfredo Martinez Vazquez on 22/02/23.
//

import Foundation
@testable import NuApp

enum MainRemoteDataManagerMockCalls {
    case sentURL
    case getURL
}

class MainRemoteDataManagerMock: MainRemoteDataInputProtocol {
    var interactor: RemoteDataOutputProtocol?
    var calls: [MainRemoteDataManagerMockCalls] = []

    func sentURL(text: String) {
        calls.append(.sentURL)
    }

    func getURL(text: String) {
        calls.append(.getURL)
    }
}
