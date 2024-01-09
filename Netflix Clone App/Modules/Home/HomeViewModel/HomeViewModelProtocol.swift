//
//  HomeViewModelProtocol.swift
//  Netflix Clone App
//
//  Created by Hüseyin BAKAR on 9.01.2024.
//

import Foundation

protocol HomeViewModelProtocol {
    
    var delegate: HomeViewModelDelegate? {get set}
    
    var homeTableItems: [HomeTableItems] {get set}
    
    var trendingMovieList: TitleResponse? {get set}
    var trendingTVList: TitleResponse? {get set}
    var popularList: TitleResponse? {get set}
    var upcomingList: TitleResponse? {get set}
    var topRatedList: TitleResponse? {get set}
    
    func fetchTrendingMovie(with url: Endpoint)
    func fetchTrendingTVs(with url: Endpoint)
    func fetchPopular(with url: Endpoint)
    func fetchUpcoming(with url: Endpoint)
    func topRated(with url: Endpoint)
}
