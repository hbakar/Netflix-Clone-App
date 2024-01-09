//
//  HomeDataProviderProtocol.swift
//  Netflix Clone App
//
//  Created by Hüseyin BAKAR on 9.01.2024.
//

import Foundation

protocol HomeDataProviderProtocol {
    func fetchTrendingMovies(with url: Endpoint, completion: @escaping(Result<TitleResponse?,Error>) ->())
    func fetchTrendingTVs(with url: Endpoint, completion: @escaping(Result<TitleResponse?,Error>) ->())
    func fetchPopular(with url: Endpoint, completion: @escaping(Result<TitleResponse?,Error>) ->())
    func fetchUpcoming(with url: Endpoint, completion: @escaping(Result<TitleResponse?,Error>) ->())
    func fetchTopRated(with url: Endpoint, completion: @escaping(Result<TitleResponse?,Error>) ->())
}
