//
//  HomeDataProvider.swift
//  Netflix Clone App
//
//  Created by Hüseyin BAKAR on 9.01.2024.
//

import Foundation

final class HomeDataProvider: HomeDataProviderProtocol {
    
    func fetchTrendingMovies(with url: Endpoint, completion: @escaping (Result<TitleResponse?, Error>) -> ()) {
        ServiceManager.shared.fetchRequest(url, completion: completion)
    } 
    
    func fetchTrendingTVs(with url: Endpoint, completion: @escaping (Result<TitleResponse?, Error>) -> ()) {
        ServiceManager.shared.fetchRequest(url, completion: completion)
    }
    
    func fetchPopular(with url: Endpoint, completion: @escaping (Result<TitleResponse?, Error>) -> ()) {
        ServiceManager.shared.fetchRequest(url, completion: completion)
    }
    
    func fetchUpcoming(with url: Endpoint, completion: @escaping (Result<TitleResponse?, Error>) -> ()) {
        ServiceManager.shared.fetchRequest(url, completion: completion)
    }
    
    func fetchTopRated(with url: Endpoint, completion: @escaping (Result<TitleResponse?, Error>) -> ()) {
        ServiceManager.shared.fetchRequest(url, completion: completion)
    }
    
}
