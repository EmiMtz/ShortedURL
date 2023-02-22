//
//  MainPresenter.swift
//  NuApp
//
//  Created by Emiliano Alfredo Martinez Vazquez on 20/02/23.
//

import Foundation

final class MainPresenter {

    // MARK: - Protocol properties

    weak var view: MainViewControllerProtocol?
    var interactor: MainInteractorInputProtocol?
    var router: MainRouterProtocol?

    // MARK: - Private properties

    private typealias Constants = MainConstants
    private var nextBlockUrl: String?
}

extension MainPresenter: MainPresenterProtocol {

    func sentURL(text: String) {
        interactor?.sentURL(text: text)
    }

    func getURL(text: String) {
        interactor?.getURL(text: text)
    }
}

extension MainPresenter: MainInteractorOutputProtocol {

    func onReceivedLinks(_ links: ShortURL) {
        view?.fillTable(links: links)
    }

    func onReceivedCompleteLink(_ link: ResponseLink) {
        view?.seeUrl(link: link.url)
    }
}
