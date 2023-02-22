//
//  ShortLinkCell.swift
//  NuApp
//
//  Created by Emiliano Alfredo Martinez Vazquez on 21/02/23.
//

import UIKit

class ShortLinkCell: UITableViewCell {

    static let cellIdentifier = "ShortLinkCell"
    @IBOutlet weak var linkLbl: UILabel!

    var link: String? {
        didSet {
            guard let link = link else {return}
            linkLbl.text = link
        }
    }
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
}
