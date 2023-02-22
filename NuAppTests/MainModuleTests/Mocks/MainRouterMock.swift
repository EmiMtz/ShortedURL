//
//  MainRouterMock.swift
//  NuAppTests
//
//  Created by Emiliano Alfredo Martinez Vazquez on 22/02/23.
//

import UIKit
@testable import NuApp

enum MainRouterMockMockCalls {
    case one
}

class MainRouterMockMock: MainRouterProtocol {
    var calls: [MainRouterMockMockCalls] = []

    func createMainModule() -> UIViewController {
        calls.append(.one)
        return UIViewController()
    }

    func popViewController(from view: MainViewControllerProtocol) {

    }
}
