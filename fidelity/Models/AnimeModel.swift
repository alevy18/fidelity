//
//  AnimeModel.swift
//  fidelity
//
//  Created by Aaron Levy on 4/23/21.
//

import Foundation

struct AnimeModel: Decodable {
    let mal_id: Int?
    let url: String?
    let image_url: String?
    let title: String?
    let airing: Bool?
    let synopsis: String?
    let type: String?
    let episodes: Int?
    let score: Float?
    let start_date: String?
    let end_date: String?
    let members: Int?
    let rated: String?
}

//gets info from given url with data to display
struct ReceivedStuff: Decodable{
    let request_hash: String
    let request_cached: Bool
    let request_cache_expiry: Int
    let results: [AnimeModel]
    
}

