//
//  tableViewExtension.swift
//  NuApp
//
//  Created by Emiliano Alfredo Martinez Vazquez on 22/02/23.
//

import UIKit

public extension UITableView {

    func registerCell<T: UITableViewCell>(_ bundle: Bundle? = nil,  _: T.Type) {
        let nib = UINib(nibName: T.reuseIdentifier, bundle: bundle ?? nil)
        self.register(nib, forCellReuseIdentifier: T.reuseIdentifier)
    }

    func dequeueCell<T: UITableViewCell>(at indexPath: IndexPath) -> T? {
        return self.dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as? T
    }
}


extension NSObject {
    public func reuseIdentifier() -> String {
        return String(describing: type(of: self))
    }

    public class var reuseIdentifier: String {
        return String(describing: self)
    }
}
