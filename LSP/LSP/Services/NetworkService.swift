//
//  NetworkService.swift
//  LSP
//
//  Created by Татьяна Овсянникова on 07.05.2021.
//

import Foundation

protocol Networking {
    func request(urlString: String, completion: @escaping (Data?, Error?) -> Void)
}

class NetworkService: Networking {
    func request(urlString: String, completion: @escaping (Data?, Error?) -> Void) {
        guard let url = URL(string: urlString) else {
            return
        }
        let request = URLRequest(url: url)
        let task = createDataTask(from: request, completion: completion)
        task.resume()
    }
    
    private func createDataTask(from urlRequest: URLRequest, completion: @escaping (Data?, Error?) -> Void) -> URLSessionDataTask {
        return URLSession.shared.dataTask(with: urlRequest, completionHandler: {(data, response, error) in
            DispatchQueue.main.async {
                completion(data, error)
            }
        })
    }
}
