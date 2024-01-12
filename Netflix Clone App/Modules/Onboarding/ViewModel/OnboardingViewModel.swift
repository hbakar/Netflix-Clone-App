//
//  OnboardingViewModel.swift
//  Netflix Clone App
//
//  Created by Hüseyin BAKAR on 11.01.2024.
//

import Foundation
import UIKit

final class OnboardingViewModel: OnboardingViewModelProtocol {
    
    var delegate: OnboardingViewModelDelegate?
    var slideList: [OnboardingSlide] = []
    
    func getData() {
        slideList = [OnboardingSlide(title: "Watch on any device", description: "Stream on your phone, tablet, laptop, and TV without paying more.", image: UIImage(named: "o1")!),OnboardingSlide(title: "Download and go", description: "Save your data, watch offline on a plane, train, or submarine...", image: UIImage(named: "o2")!),OnboardingSlide(title: "No pesky contracts", description: "Join today, cancel anytime.", image: UIImage(named: "o3")!),OnboardingSlide(title: "Unlimited entertainment, one low price", description: "Stream and download as much as you want, no extra fees.", image: UIImage(named: "o3")!)]
        self.delegate?.notify(.didFetchOnboardingList)
    }
}

protocol OnboardingViewModelDelegate: AnyObject {
    func notify(_ event: OnboardingViewModelEvent)
}

enum OnboardingViewModelEvent {
    case didFetchOnboardingList
    case fetchFailed(Error)
}
