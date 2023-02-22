//
//  MainModuleRouter.swift
//  NuApp
//
//  Created by Emiliano Alfredo Martinez Vazquez on 20/02/23.
//

import UIKit

final class MainRouter {
}

extension MainRouter: MainRouterProtocol {

    func createMainModule() -> UIViewController {
        let view = MainViewController()
        let interactor = MainInteractor()
        let presenter = MainPresenter()
        let remoteData = MainRemoteDataManager(service: ServiceAPI(session: URLSession.shared))

        view.presenter = presenter
        presenter.linkDependencies(view: view, router: self, interactor: interactor)
        interactor.linkDependencies(remoteData: remoteData, presenter: presenter)
        remoteData.interactor = interactor

        return (view as UIViewController)
    }

    func popViewController(from view: MainViewControllerProtocol) {
        guard let viewController: UIViewController = view as? UIViewController else { return }
        viewController.navigationController?.popViewController(animated: true)
    }

    // MARK: - Private methods

    private func buildModuleComponents() {

    }

    private func linkDependencies() {

    }
}
