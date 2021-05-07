//
//  DataFetcherService.swift
//  LSP
//
//  Created by Татьяна Овсянникова on 07.05.2021.
//

import Foundation

class DataFetcherService {
    var networkDataFetcher: DataFetcher
    var localDataFetcher: DataFetcher
    
    init(dataFetcher: DataFetcher = NetworkDataFetcher(), localDataFetcher: DataFetcher = LocalDataFetcher()) {
        self.networkDataFetcher = dataFetcher
        self.localDataFetcher = localDataFetcher
    }
    
    func fetchPlaylists(completion: @escaping (SongsGroup?) -> Void) {
        let urlPlaylists = "https://rss.itunes.apple.com/api/v1/us/apple-music/hot-tracks/all/25/explicit.json"
        networkDataFetcher.fetchGenericJSONData(urlString: urlPlaylists, response: completion)
    }
    
    func fetchUsers(completion: @escaping ([User]?) -> Void) {
        let urlUsers = "https://www.hackingwithswift.com/samples/friendface.json"
        networkDataFetcher.fetchGenericJSONData(urlString: urlUsers, response: completion)
    }
    
    func fetchLocalUsers(completion: @escaping ([User]?) -> Void) {
        let localURLString = "usersAPI.txt"
        localDataFetcher.fetchGenericJSONData(urlString: localURLString, response: completion)
    }
}
