//
//  DownloadsListViewModel.swift
//  Netflix Clone App
//
//  Created by Hüseyin BAKAR on 10.01.2024.
//

import Foundation

final class DownloadsListViewModel: DownloadsListViewModelProtocol {
    
    weak var delegate: DownloadsListViewModelDelegate?
    
    var downloadsList: TitleResponse?
    
    private let service: DownloadsListViewModelProtocol
    
    init(service: DownloadsListViewModelProtocol) {
        self.service = service
    }
    
    func fetchDownloadList(with url: Endpoint, completion: @escaping (Result<TitleResponse?, Error>) -> ()) {
        service.fetchDownloadList(with: url) { [weak self] results in
            switch results {
            case .success(let success):
                self?.downloadsList = success
                self?.delegate?.notify(.didFetchDownloadList)
            case .failure(let failure):
                self?.delegate?.notify(.fetchFailed(failure))
            }
        }
    }
}

protocol DownloadsListViewModelDelegate: AnyObject {
    func notify(_ event: DownloadsListViewModelEvents)
}

enum DownloadsListViewModelEvents {
    case didFetchDownloadList
    case fetchFailed(Error)
}
