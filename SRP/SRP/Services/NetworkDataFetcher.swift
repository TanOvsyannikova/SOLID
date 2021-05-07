//
//  NetworkDataFetcher.swift
//  SRP
//
//  Created by Татьяна Овсянникова on 07.05.2021.
//

import Foundation

class NetworkDataFetcher {
    var networkService = NetworkService()
    
    init(networkService: NetworkService = NetworkService()) {
        self.networkService = networkService
    }
    
    func dataFetcher(urlString: String) {
        networkService.request(urlString: urlString) { (data, error) in
            let decoder = JSONDecoder()
            guard let data = data else { return }
            let response = try? decoder.decode([User].self, from: data)
            print(response)
        }
    }
}
