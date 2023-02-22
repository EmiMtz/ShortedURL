//
//  HomeView.swift
//  NuApp
//
//  Created by Emiliano Alfredo Martinez Vazquez on 20/02/23.
//

import Foundation
import UIKit

final class HomeViewController: UIViewController {
    // MARK: - Protocol properties
    var presenter: HomePresenterProtocol?

    private let start: UIButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        displayButton()
    }

    // MARK: - Private functions
    private func displayButton() {
        view.addSubview(start)
        start.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            start.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            start.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            start.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            start.heightAnchor.constraint(equalTo: start.widthAnchor, multiplier: 0.4)
        ])
        start.backgroundColor = .purple
        start.layer.cornerRadius = 8.0
        start.setTitleColor(.white, for: .normal)
        setupButton()
    }

    private func setupButton() {
        start.addTarget(self, action: #selector(launchApp), for: .touchUpInside)
        start.setTitle("Show App", for: .normal)
    }

    @objc private func launchApp() {
        presenter?.willPresentApp()
    }
}

extension HomeViewController: HomeViewControllerProtocol {

}
