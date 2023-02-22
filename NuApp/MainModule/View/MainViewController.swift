//
//  MainViewController.swift
//  NuApp
//
//  Created by Emiliano Alfredo Martinez Vazquez on 20/02/23.
//

import UIKit

class MainViewController: UIViewController, MainViewControllerProtocol {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var sentURLBtn: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var btnSortedLinks: UIButton!
    @IBOutlet weak var fullUrlLabel: UILabel!

    var presenter: MainPresenterProtocol?
    var text = ""
    var links: [ShortURL] = []

    // MARK: - Private properties
    private typealias Constants = MainConstants

    init() {
        super.init(nibName: String(describing: MainViewController.self), bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        super.loadView()
        setupNavigationBar()
        setUpView()
        registerCells()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = .white
    }

    // MARK: - Private methods
    private func setUpView() {
        sentURLBtn.layer.cornerRadius = 10
        sentURLBtn.backgroundColor = .purple
        let image = UIImage(named: "sent")?.withRenderingMode(.alwaysTemplate)
        sentURLBtn.image = image
        sentURLBtn.tintColor = .white
        textField.delegate = self
        textField.addTarget(self, action: #selector(MainViewController.textFieldDidChange(_:)), for: .editingChanged)
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        sentURLBtn.isUserInteractionEnabled = true
        sentURLBtn.addGestureRecognizer(tapGestureRecognizer)
    }

    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        presenter?.sentURL(text: text)
    }

    private func setupNavigationBar() {
        title = "Nu Test"
    }

    private func registerCells() {
        let nib = UINib(nibName: ShortLinkCell.cellIdentifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: ShortLinkCell.cellIdentifier)
        tableView.delegate = self
        tableView.dataSource = self

    }

    func fillTable(links: ShortURL) {
        self.links.append(links)
        DispatchQueue.main.async {
            self.textField.text = ""
            self.tableView.reloadData()
        }
    }

    func seeUrl(link: String) {
        DispatchQueue.main.async {
            self.fullUrlLabel.text = link
        }
    }

    @objc func textFieldDidChange(_ textField: UITextField) {
        guard let inputText = textField.text else { return }
        text = inputText
    }

    @IBAction func onClickShortedLinks(_ sender: Any) {
        presenter?.getURL(text: text)
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        links.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: ShortLinkCell = tableView.dequeueReusableCell(withIdentifier: ShortLinkCell.cellIdentifier) as? ShortLinkCell else { return UITableViewCell() }
        let link = links[indexPath.row].alias
        cell.link = link
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let link = links[indexPath.row].alias
        presenter?.getURL(text: link)
    }
}

extension MainViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let inputText = textField.text else { return }
        text = inputText
    }
}
