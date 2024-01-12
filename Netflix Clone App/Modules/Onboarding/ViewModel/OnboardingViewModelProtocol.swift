//
//  OnboardingViewModelProtocol.swift
//  Netflix Clone App
//
//  Created by Hüseyin BAKAR on 11.01.2024.
//

import Foundation

protocol OnboardingViewModelProtocol {
    var delegate: OnboardingViewModelDelegate? {get set}
    var slideList: [OnboardingSlide] {get set}
    func getData()
}
