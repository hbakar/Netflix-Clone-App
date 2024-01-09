//
//  UpcomingViewModelProtocol.swift
//  Netflix Clone App
//
//  Created by Hüseyin BAKAR on 9.01.2024.
//

import Foundation

protocol UpcomingViewModelProtocol {
   
    var delegate: UpcomingViewModelDelegate? {get set}
    
    var upcomingList: TitleResponse? {get set}
    
    func fetchUpcoming(with url: Endpoint, completion: @escaping(Result<TitleResponse?, Error>) ->())
}
