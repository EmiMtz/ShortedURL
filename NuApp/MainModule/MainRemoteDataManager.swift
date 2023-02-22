//
//  MainRemoteDataManager.swift
//  NuApp
//
//  Created by Emiliano Alfredo Martinez Vazquez on 20/02/23.
//

import Foundation

import Foundation

final class MainRemoteDataManager {

    // MARK: - Protocol properties
    weak var interactor: RemoteDataOutputProtocol?

    private var service: Service

    init(service: Service) {
        self.service = service
    }
}

extension MainRemoteDataManager: MainRemoteDataInputProtocol {

    func sentURL(text: String) {
        let request = ResponseLink(url: text)
        service.post(Endpoint.shortenURL, url: request) { [weak self] (result: Result<ShortURL, Error>) in
            switch result {
            case .success(let links):
                self?.interactor?.handleLinklockFetch(links)
            case .failure(let error):
                self?.interactor?.handleService(error: error)
            }
        }
    }

    func getURL(text: String) {
        service.get(Endpoint.readShortenURL(id: text)) { [weak self] (result: Result<ResponseLink, Error>) in
            switch result {
            case .success(let link):
                self?.interactor?.handleCompleteLink(link)
            case .failure(let error):
                self?.interactor?.handleService(error: error)
            }
        }
    }
}
