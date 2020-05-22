//
//  Itunes.swift
//  GenericNetworkLayer
//
//  Created by Sebastien Bastide on 22/05/2020.
//  Copyright © 2020 Sebastien Bastide. All rights reserved.
//

import Foundation

struct Itunes: Decodable {
    let results: [iTunesResult]
}

struct iTunesResult: Decodable {
    let artistName: String
}
