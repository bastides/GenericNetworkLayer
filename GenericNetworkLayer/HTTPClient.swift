//
//  HTTPClient.swift
//  GenericNetworkLayer
//
//  Created by Sebastien Bastide on 22/05/2020.
//  Copyright © 2020 Sebastien Bastide. All rights reserved.
//

import Foundation

final class HTTPClient {

    // MARK: - Properties

    private let httpEngine: HTTPEngine

    // MARK: - Initializer

    init(httpEngine: HTTPEngine = HTTPEngine(session: URLSession(configuration: .default))) {
        self.httpEngine = httpEngine
    }

    func request<T: Decodable>(baseUrl: URL, parameters: [(String, Any)]?, callback: @escaping (Result<T, NetworkError>) -> Void) {
        httpEngine.request(baseUrl: baseUrl, parameters: parameters) { data, response, error in
            guard let data = data, error == nil else {
                callback(.failure(.undecodableData))
                return
            }
            guard let response = response, response.statusCode == 200 else {
                callback(.failure(.noResponse))
                return
            }
            guard let dataDecoded = try? JSONDecoder().decode(T.self, from: data) else {
                callback(.failure(.undecodableData))
                return
            }
            callback(.success(dataDecoded))
        }
    }
}
