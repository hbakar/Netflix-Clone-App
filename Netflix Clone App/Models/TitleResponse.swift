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
    let id: Int?
    let media_type: String?
    let original_name: String?
    let original_title: String?
    let poster_path: String?
    let overview: String?
    let vote_count: Int?
    let release_date: String?
    let vote_average: Double?
}
