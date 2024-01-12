//
//  DownloadsListViewModelProtocol.swift
//  Netflix Clone App
//
//  Created by Hüseyin BAKAR on 10.01.2024.
//

import Foundation

protocol DownloadsListViewModelProtocol {
    
    var delegate: DownloadsListViewModelDelegate? {get set}
    
    var downloadsList: TitleResponse? {get set}
    
    func fetchDownloadList(with url: Endpoint, completion: @escaping(Result<TitleResponse?, Error>) ->())
}
