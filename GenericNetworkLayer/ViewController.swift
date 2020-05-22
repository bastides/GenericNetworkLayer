//
//  ViewController.swift
//  GenericNetworkLayer
//
//  Created by Sebastien Bastide on 22/05/2020.
//  Copyright © 2020 Sebastien Bastide. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

    // MARK: - Properties

    private let httpClient: HTTPClient = HTTPClient()

    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let url = URL(string: "https://itunes.apple.com/lookup?") else { return }
        httpClient.request(baseUrl: url, parameters: [("id", "909253")]) { [unowned self] (result: Result<Itunes, NetworkError>) in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    print("Hi! My name is \(data.results[0].artistName).")
                }
            case .failure(let error):
                self.showAlert(with: error.description)
            }
        }
    }


}

extension UIViewController {
    func showAlert(with message: String) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alertController, animated: true)
    }
}
