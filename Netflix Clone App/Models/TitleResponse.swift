//
//  TitleResponse.swift
//  Netflix Clone App
//
//  Created by Hüseyin BAKAR on 9.01.2024.
//

import Foundation

struct TitleResponse: Decodable {
    let results: [TitleResultResponse]?
}

struct TitleResultResponse: Decodable {
    let Id: Int?
    let mediaType: String?
    let originalName: String?
    let originalTitle: String?
    let posterPath: String?
    let overview: String?
    let voteCount: String?
    let date: String?
    let voteAverage: Double?
    
    enum CodingKeys: String, CodingKey {
        case Id = "id"
        case mediaType = "media_type"
        case originalName = "original_name"
        case originalTitle = "original_title"
        case posterPath = "poster_path"
        case overview
        case voteCount = "vote_count"
        case date = "release_date"
        case voteAverage = "vote_average"
    }
}
