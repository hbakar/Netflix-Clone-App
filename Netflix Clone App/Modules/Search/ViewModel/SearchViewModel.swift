//
//  SearchViewModel.swift
//  Netflix Clone App
//
//  Created by Hüseyin BAKAR on 9.01.2024.
//

import Foundation


final class SearchViewModel: SearchViewModelProtocol {
    
    var currentPage: Int = Int()
    
    var discoverList: TitleResponse?
    
    weak var delegate: SearchViewModelDelegate?
    
    private let service: SearchDataProviderProtocol
    
    init(service: SearchDataProviderProtocol) {
        self.service = service
    }
    
    func fetchData(with endpoint: Endpoint) {
        service.fetchData(with: endpoint) { [weak self] results in
            switch results {
            case .success(let success):
                self?.discoverList = success
                self?.delegate?.notify(.didFetchSearchList)
            case .failure(let failure):
                self?.delegate?.notify(.fetchFailed(failure))
            }
        }
    }
}

protocol SearchViewModelDelegate: AnyObject {
    func notify(_ event: SearchViewModelEvents)
}

enum SearchViewModelEvents {
    case didFetchSearchList
    case fetchFailed(Error)
}
