//
//  MainInteractor.swift
//  NuApp
//
//  Created by Emiliano Alfredo Martinez Vazquez on 20/02/23.
//

import Foundation

class MainInteractor {

    // MARK: - Protocol properties

    weak var presenter: MainInteractorOutputProtocol?
    var remoteData: MainRemoteDataInputProtocol?

}

extension MainInteractor: MainInteractorInputProtocol {

    func sentURL(text: String) {
        remoteData?.sentURL(text: text)
    }

    func getURL(text: String) {
        remoteData?.getURL(text: text)
    }
}

extension MainInteractor: RemoteDataOutputProtocol {
    func handleLinklockFetch(_ links: ShortURL) {
        self.presenter?.onReceivedLinks(links)
    }

    func handleCompleteLink(_ link: ResponseLink) {
        self.presenter?.onReceivedCompleteLink(link)
    }

    func handleService(error: Error) {
        // TODO: Return data to presenter
        debugPrint("Returns data to presenter", error)
    }
}
