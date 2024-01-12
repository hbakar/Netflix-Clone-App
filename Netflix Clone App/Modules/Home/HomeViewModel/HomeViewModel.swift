//
//  HomeViewModel.swift
//  Netflix Clone App
//
//  Created by Hüseyin BAKAR on 9.01.2024.
//

import Foundation

final class HomeViewModel: HomeViewModelProtocol {
    
    weak var delegate: HomeViewModelDelegate?
    
    var homeTableItems: [HomeTableItems] = []
    
    var trendingMovieList: TitleResponse?
    
    var trendingTVList: TitleResponse?
    
    var popularList: TitleResponse?
    
    var upcomingList: TitleResponse?
    
    var topRatedList: TitleResponse?
    
    private let service: HomeDataProviderProtocol
    
    init(service: HomeDataProviderProtocol) {
        self.service = service
    }
    
    func fetchTrendingMovie(with url: Endpoint) {
        service.fetchTrendingMovies(with: url) { [weak self] results in
            switch results {
            case .success(let success):
                self?.trendingMovieList = success
                self?.delegate?.notify(.didFetchTrendingMovieList)
            case .failure(let failure):
                self?.delegate?.notify(.fetchFailedTrendingMovieList(failure))
            }
        }
    }
    
    func fetchTrendingTVs(with url: Endpoint) {
        service.fetchTrendingTVs(with: url) { [weak self] results in
            switch results {
            case .success(let success):
                self?.trendingTVList = success
                self?.delegate?.notify(.didFetchTrendingTVList)
            case .failure(let failure):
                self?.delegate?.notify(.fetchFailedTrendingTVs(failure))
            }
        }
    }
    
    func fetchPopular(with url: Endpoint) {
        service.fetchPopular(with: url) { [weak self] results in
            switch results {
            case .success(let success):
                self?.popularList = success
                self?.delegate?.notify(.didFetchPopularList)
            case .failure(let failure):
                self?.delegate?.notify(.fetchFailedPopularList(failure))
            }
        }
    }
    
    func fetchUpcoming(with url: Endpoint) {
        service.fetchUpcoming(with: url) { [weak self] results in
            switch results {
            case .success(let success):
                self?.upcomingList = success
                self?.delegate?.notify(.didFetchUpcomingList)
            case .failure(let failure):
                self?.delegate?.notify(.fetchFailedUpcomingList(failure))
            }
        }
    }
    
    func topRated(with url: Endpoint) {
        service.fetchTopRated(with: url) { [weak self] results in
            switch results {
            case .success(let success):
                self?.topRatedList = success
                self?.delegate?.notify(.didFetchTopRatedList)
            case .failure(let failure):
                self?.delegate?.notify(.fetchFailedTopRatedList(failure))
            }
        }
    }
    
}

protocol HomeViewModelDelegate: AnyObject {
    func notify(_ event: HomeViewModelEvents)
}

enum HomeViewModelEvents {
    case didFetchTrendingMovieList
    case fetchFailedTrendingMovieList(Error)
    case didFetchTrendingTVList
    case fetchFailedTrendingTVs(Error)
    case didFetchPopularList
    case fetchFailedPopularList(Error)
    case didFetchUpcomingList
    case fetchFailedUpcomingList(Error)
    case didFetchTopRatedList
    case fetchFailedTopRatedList(Error)
}

enum HomeTableItems {
    case trendingMoviesTableItem
    case trendingTVsTableItem
    case popularTableItem
    case upcomingTableItem
    case topRatedTableItem
}
