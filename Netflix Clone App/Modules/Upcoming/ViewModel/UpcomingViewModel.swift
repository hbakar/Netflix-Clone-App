//
//  UpcomingViewModel.swift
//  Netflix Clone App
//
//  Created by Hüseyin BAKAR on 9.01.2024.
//

import Foundation

final class UpcomingViewModel: UpcomingViewModelProtocol {
    
    var delegate: UpcomingViewModelDelegate?
    
    var upcomingList: TitleResponse?
    
    var currentPage: Int = Int()
    
    private let service: UpComingDataProviderProtocol
    
    init(service: UpComingDataProviderProtocol) {
        self.service = service
    }
    
    func fetchUpcoming(with url: Endpoint) {
        service.fetchUpcoming(with: url) { [weak self] results in
            switch results {
            case .success(let success):
                self?.upcomingList = success
                self?.delegate?.notify(.didFetchUpcoming)
            case .failure(let failure):
                self?.delegate?.notify(.fetchFailedUpcoming(failure))
            }
        }
    }
}

protocol UpcomingViewModelDelegate: AnyObject {
    func notify(_ event: UpcomingViewModelEvents)
}

enum UpcomingViewModelEvents {
    case didFetchUpcoming
    case fetchFailedUpcoming(Error)
}
