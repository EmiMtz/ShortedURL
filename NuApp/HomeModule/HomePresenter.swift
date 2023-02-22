//
//  HomePresenter.swift
//  NuApp
//
//  Created by Emiliano Alfredo Martinez Vazquez on 20/02/23.
//

import Foundation

final class HomePresenter {
    var router: HomeRouterProtocol?
}

extension HomePresenter: HomePresenterProtocol {
    func willPresentApp() {
        router?.presentMainModule()
    }
}
