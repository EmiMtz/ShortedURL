//
//  MainModuleProtocols.swift
//  NuApp
//
//  Created by Emiliano Alfredo Martinez Vazquez on 20/02/23.
//

import Foundation
import UIKit

// MARK: - VIPER protocols

// Presenter > Router
protocol MainRouterProtocol: AnyObject {
    func createMainModule() -> UIViewController
    func popViewController(from view: MainViewControllerProtocol)
}

// View > Presenter
protocol MainViewControllerProtocol: AnyObject {
    var presenter: MainPresenterProtocol? { get set }

    func fillTable(links: ShortURL)
    func seeUrl(link: String)
}

// Presenter > View
protocol MainPresenterProtocol: AnyObject {
    var view: MainViewControllerProtocol? { get set }
    var router: MainRouterProtocol? { get set }

    func sentURL(text: String)
    func getURL(text: String)
}

extension MainPresenterProtocol {
    func linkDependencies(view: MainViewControllerProtocol, router: MainRouterProtocol, interactor: MainInteractorInputProtocol) {
        self.view = view
        (self as? MainInteractorOutputProtocol)?.interactor = interactor
        self.router = router
    }
}

// Interactor > Presenter
protocol MainInteractorInputProtocol: AnyObject {
    var presenter: MainInteractorOutputProtocol? { get set }
    var remoteData: MainRemoteDataInputProtocol? { get set }
    
    func sentURL(text: String)
    func getURL(text: String)
}

extension MainInteractorInputProtocol {
    func linkDependencies(remoteData: MainRemoteDataInputProtocol, presenter: MainInteractorOutputProtocol) {
        self.presenter = presenter
        self.remoteData = remoteData
    }
}

// Presenter > Interactor
protocol MainInteractorOutputProtocol: AnyObject {
    var interactor: MainInteractorInputProtocol? { get set }

    func onReceivedLinks(_ links: ShortURL)
    func onReceivedCompleteLink(_ link: ResponseLink)
}

// Interactor > RemoteData
protocol MainRemoteDataInputProtocol {
    var interactor: RemoteDataOutputProtocol? { get set }

    func sentURL(text: String)
    func getURL(text: String)
}

// RemoteData > Interactor
protocol RemoteDataOutputProtocol: AnyObject {
    func handleLinklockFetch(_ links: ShortURL)
    func handleCompleteLink(_ link: ResponseLink)
    func handleService(error: Error)
}
