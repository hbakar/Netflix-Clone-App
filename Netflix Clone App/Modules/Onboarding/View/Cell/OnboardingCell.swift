//
//  OnboardingCell.swift
//  Netflix Clone App
//
//  Created by Hüseyin BAKAR on 11.01.2024.
//

import UIKit

protocol OnboardingCellDelegate: AnyObject {
    func didClicked()
}

class OnboardingCell: UICollectionViewCell {
    
    @IBOutlet weak var gradientView: Gradient!
    
    @IBOutlet private weak var onboardImage: UIImageView!
    
    @IBOutlet weak var onboardTitle: UILabel!
    
    weak var delegate: OnboardingCellDelegate?
    
    var indexPath: IndexPath?
    
    @IBOutlet weak var onboardDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // setGradientBackground()
        gradientView.clipsToBounds = true
       // gradientView.layer.cornerRadius = 24
    }
    
    func prepareforOnboardItem(with model: OnboardingSlide) {
        
        DispatchQueue.main.async {
            self.onboardTitle.text = model.title
            self.onboardDescription.text = model.description
            self.onboardImage.image = model.image
        }
    }
    
}
