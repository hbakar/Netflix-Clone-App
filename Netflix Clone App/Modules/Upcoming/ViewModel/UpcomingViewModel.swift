//
//  UpcomingViewModel.swift
//  Netflix Clone App
//
//  Created by Hüseyin BAKAR on 9.01.2024.
//

import Foundation

final class UpcomingViewModel: UpcomingViewModelProtocol {
    
    var upcomingList: TitleResponse?
    
    private let service: UpComingDataProviderProtocol
    
    init(service: UpComingDataProviderProtocol) {
        self.service = service
    }
    
    func fetchUpcoming(with url: Endpoint, completion: @escaping (Result<TitleResponse?, Error>) -> ()) {
        service.fetchUpcoming(with: url) { [weak self] results in
            switch results {
            case .success(let success):
                <#code#>
            case .failure(let failure):
                <#code#>
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
