//
//  DownloadListDataProviderProtocol.swift
//  Netflix Clone App
//
//  Created by Hüseyin BAKAR on 10.01.2024.
//

import Foundation

protocol DownloadListDataProviderProtocol {
    
    func fetchDownloadList(with url: Endpoint, completion: @escaping(Result<TitleResponse?, Error>) ->())
    
    
}
