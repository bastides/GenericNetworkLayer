//
//  NetworkError.swift
//  GenericNetworkLayer
//
//  Created by Sebastien Bastide on 22/05/2020.
//  Copyright © 2020 Sebastien Bastide. All rights reserved.
//

import Foundation

enum NetworkError: Error, CustomStringConvertible {
    case noData
    case noResponse
    case undecodableData

    var description: String {
        switch self {
        case .noData:
            return "There is no data !"
        case .noResponse:
            return "Response status is incorrect !"
        case .undecodableData:
            return "Data can't be decoded !"
        }
    }
}
