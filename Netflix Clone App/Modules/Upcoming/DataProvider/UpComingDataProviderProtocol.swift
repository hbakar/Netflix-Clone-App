//
//  UpComingDataProviderProtocol.swift
//  Netflix Clone App
//
//  Created by Hüseyin BAKAR on 9.01.2024.
//

import Foundation

protocol UpComingDataProviderProtocol {
    func fetchUpcoming(with endpoint: Endpoint, completion: @escaping(Result<TitleResponse, Error>) ->())
}
