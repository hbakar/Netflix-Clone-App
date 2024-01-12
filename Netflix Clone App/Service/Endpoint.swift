//
//  Endpoint.swift
//  Netflix Clone App
//
//  Created by Hüseyin BAKAR on 9.01.2024.
//

import Foundation

protocol EndpointProtocol {
    var baseURL: String {get}
    var path: String {get}
    var method: HTTPMethod {get}
    var header: [String: String]? {get}
    var parameters: [String: Any]? {get}
    func request() -> URLRequest
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case delete = "DELETE"
    case patch = "PATCH"
}

enum Endpoint {
    case trendingMovie
    case trendingTVs
    case popular
    case upcoming(page: String)
    case topRated
    case discover(page: String)
}

extension Endpoint: EndpointProtocol {
    
    var baseURL: String {
        "https://api.themoviedb.org"
    }
    
    var path: String {
        switch self {
        case .trendingMovie: return "/3/trending/movie/day"
        case .trendingTVs: return "/3/trending/tv/day"
        case .popular: return "/3/movie/popular"
        case .topRated: return "/3/movie/top_rated"
        case .upcoming: return "/3/movie/upcoming"
        case .discover: return "/3/discover/movie"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .trendingMovie: return .get
        case .trendingTVs: return .get
        case .popular: return .get
        case .upcoming: return .get
        case .topRated: return .get
        case .discover: return .get
        }
    }
    
    var header: [String : String]? {
        let header: [String: String] = ["Content-type": "application/json; charset=UTF-8"]
        return header
    }
    
    var parameters: [String : Any]? {
        /*
         if case .getUpcoming(let title,let body, let userId) = self {
         // return ["title": title,"body": body, "userId": userId]
         }
         */
        return nil
    }
    
    func request() -> URLRequest {
        
        guard var components = URLComponents(string: baseURL) else {
            fatalError("URL ERROR")
        }
        
        if case .trendingMovie = self {
            components.queryItems = [URLQueryItem(name: Constant.apiKey, value: Constant.apiKeyDesc)]
        }
        
        if case .trendingTVs = self {
            components.queryItems = [URLQueryItem(name: Constant.apiKey, value: Constant.apiKeyDesc)]
        }
        
        if case .popular = self {
            components.queryItems = [URLQueryItem(name: Constant.apiKey, value: Constant.apiKeyDesc)]
        }
        
        if case .upcoming(let page) = self {
            components.queryItems = [URLQueryItem(name: Constant.apiKey, value: Constant.apiKeyDesc),
                                     URLQueryItem(name: Constant.language, value: Constant.langCode),
                                     URLQueryItem(name: Constant.page, value: page)]
        }
        
        if case .discover(let page) = self {
            components.queryItems = [URLQueryItem(name: Constant.apiKey, value: Constant.apiKeyDesc),
                                     URLQueryItem(name: Constant.language, value: Constant.langCode),
                                     URLQueryItem(name: Constant.sort_by, value: Constant.popularityDesc),
                                     URLQueryItem(name: Constant.includeAdult, value: Constant.includeAdultFalse),
                                     URLQueryItem(name: Constant.include_video, value: Constant.include_video_false),
                                     URLQueryItem(name: Constant.page, value: page),
                                     URLQueryItem(name: Constant.with_watch_monetization_types, value: Constant.with_watch_monetization_types_desc)
            ]
        }
        
        components.path = path
        var request = URLRequest(url: components.url!)
        request.httpMethod = method.rawValue
        
        if let parameters {
            do {
                let data = try JSONSerialization.data(withJSONObject: parameters)
                request.httpBody = data
            }
            catch {
                print(error.localizedDescription)
            }
        }
        
        if let header = header {
            for (key, value) in header {
                request.setValue(value, forHTTPHeaderField: key)
            }
        }
        
        return request
    }
    
}
