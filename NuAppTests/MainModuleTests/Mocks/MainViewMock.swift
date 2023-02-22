//
//  MainViewMock.swift
//  NuAppTests
//
//  Created by Emiliano Alfredo Martinez Vazquez on 22/02/23.
//

import Foundation
@testable import NuApp
import UIKit

class MainViewMock: UIViewController, MainViewControllerProtocol {
    var presenter: MainPresenterProtocol?
    var calls: [String:Any] = [:]

    func fillTable(links: ShortURL) {
        calls["alias"] = links.alias
    }

    func seeUrl(link: String) {
        calls["link"] = link
    }
}
