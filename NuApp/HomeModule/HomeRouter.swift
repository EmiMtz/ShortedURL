//
//  HomeRouter.swift
//  NuApp
//
//  Created by Emiliano Alfredo Martinez Vazquez on 20/02/23.
//

import UIKit

final class HomeRouter {
    // MARK: Protocol properties
    var view: HomeViewControllerProtocol?
    var presenter: HomePresenterProtocol?
    var router: HomeRouterProtocol?

}

extension HomeRouter: HomeRouterProtocol {

    func createStartModule() -> UINavigationController {
        buildModuleComponents()
        linkDependencies()
        guard let viewController: UIViewController = view as? UIViewController else {
            return UINavigationController()
        }
        let navigationController: UINavigationController = UINavigationController(rootViewController: viewController)
        return navigationController
    }

    func presentMainModule() {
        guard let viewController: UIViewController = (self.view as? UIViewController) else { return }
        let mainRouter: MainRouterProtocol = MainRouter()
        let mainViewController = mainRouter.createMainModule()
        viewController.navigationController?.pushViewController(mainViewController, animated: true)
    }

    // MARK: Private methods

    private func buildModuleComponents() {
        view = HomeViewController()
        presenter = HomePresenter()
        router = self

    }

    private func linkDependencies() {
        view?.presenter = self.presenter
        presenter?.router = self
    }
}
