//
//  MainEntity.swift
//  NuApp
//
//  Created by Emiliano Alfredo Martinez Vazquez on 20/02/23.
//

import UIKit

struct ShortURL: Codable {
    let alias: String
    let links: LinksModel

    enum CodingKeys: String, CodingKey {
        case alias
        case links = "_links"
    }
}

struct LinksModel: Codable {
    let selfResponse: String
    let short: String

    enum CodingKeys: String, CodingKey {
        case selfResponse = "self"
        case short
    }
}

struct ResponseLink: Codable {
    let url: String
}
