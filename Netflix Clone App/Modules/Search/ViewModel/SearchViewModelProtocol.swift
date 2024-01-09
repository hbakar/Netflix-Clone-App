//
//  SearchViewModelProtocol.swift
//  Netflix Clone App
//
//  Created by Hüseyin BAKAR on 9.01.2024.
//

import Foundation

protocol SearchViewModelProtocol {
    
    var currentPage: Int { get set}
    
    var delegate: SearchViewModelDelegate? {get set}
    
    var discoverList: TitleResponse? {get set}
    
    func fetchData(with endpoint:Endpoint)
}
