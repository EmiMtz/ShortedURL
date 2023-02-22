//
//  HomeProtocols.swift
//  NuApp
//
//  Created by Emiliano Alfredo Martinez Vazquez on 20/02/23.
//

import UIKit

protocol HomeRouterProtocol {
    var view: HomeViewControllerProtocol? { get set }
    var presenter: (HomePresenterProtocol)? { get set }
    var router: HomeRouterProtocol? { get set }

    func createStartModule() -> UINavigationController
    func presentMainModule()
}

protocol HomeViewControllerProtocol {
    var presenter: HomePresenterProtocol? { get set }
}

protocol HomePresenterProtocol {
    var router: HomeRouterProtocol? { get set }

    func willPresentApp()
}

