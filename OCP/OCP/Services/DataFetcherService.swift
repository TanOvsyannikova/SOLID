//
//  DataFetcherService.swift
//  OCP
//
//  Created by Татьяна Овсянникова on 07.05.2021.
//

import Foundation

class DataFetcherService {
    var dataFetcher: DataFetcher
    
    init(dataFetcher: DataFetcher = NetworkDataFetcher()) {
        self.dataFetcher = dataFetcher
    }
    
    func fetchPlaylists(completion: @escaping (SongsGroup?) -> Void) {
        let urlPlaylists = "https://rss.itunes.apple.com/api/v1/us/apple-music/hot-tracks/all/25/explicit.json"
        dataFetcher.fetchGenericJSONData(urlString: urlPlaylists, response: completion)
    }
    
    func fetchUsers(completion: @escaping ([User]?) -> Void) {
        let urlUsers = "https://www.hackingwithswift.com/samples/friendface.json"
        dataFetcher.fetchGenericJSONData(urlString: urlUsers, response: completion)
    }
}
