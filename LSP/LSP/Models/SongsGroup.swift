//
//  SongsGroup.swift
//  LSP
//
//  Created by Татьяна Овсянникова on 07.05.2021.
//

import Foundation

struct SongsGroup: Decodable {
    let feed: Feed
}

struct Feed: Decodable {
    let title: String
    let results: [FeedResult]
}

struct FeedResult: Decodable {
    let id: String
    let name: String
    let kind: String
}
