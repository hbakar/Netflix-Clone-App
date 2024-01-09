//
//  UpComingDataProvider.swift
//  Netflix Clone App
//
//  Created by Hüseyin BAKAR on 9.01.2024.
//

import Foundation

final class UpComingDataProvider: UpComingDataProviderProtocol {
    func fetchUpcoming(with endpoint: Endpoint, completion: @escaping (Result<TitleResponse, Error>) -> ()) {
        ServiceManager.shared.fetchRequest(endpoint, completion: completion)
    }
}
