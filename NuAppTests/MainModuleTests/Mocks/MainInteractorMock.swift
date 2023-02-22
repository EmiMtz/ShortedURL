//
//  MainInteractorMock.swift
//  NuAppTests
//
//  Created by Emiliano Alfredo Martinez Vazquez on 22/02/23.
//

import Foundation
@testable import NuApp

enum MainInteractorMockCalls {
    case sentURL
    case getUrl
    case onReceivedLinks
    case onReceivedCompleteLink
}

class MainInteractorMock: MainInteractorInputProtocol, MainInteractorOutputProtocol {
    var interactor: MainInteractorInputProtocol?
    var presenter: MainInteractorOutputProtocol?
    var remoteData: MainRemoteDataInputProtocol?
    var calls: [MainInteractorMockCalls] = []

    func sentURL(text: String) {
        calls.append(.sentURL)
    }

    func getURL(text: String) {
        calls.append(.getUrl)
    }

    func onReceivedLinks(_ links: ShortURL) {
        calls.append(.onReceivedLinks)
    }

    func onReceivedCompleteLink(_ link: ResponseLink) {
        calls.append(.onReceivedCompleteLink)
    }

}
