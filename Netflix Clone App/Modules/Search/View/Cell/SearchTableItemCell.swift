//
//  TitleTableViewCell.swift
//  Netflix Clone App
//
//  Created by Hüseyin BAKAR on 9.01.2024.
//

import UIKit
import Kingfisher


class SearchTableItemCell: UITableViewCell {
    
    @IBOutlet weak var posterImage: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var playButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        posterImage.layer.cornerRadius = 12
        posterImage.layer.borderWidth = 1
        posterImage.layer.borderColor = UIColor(white: 0.95, alpha: 1).cgColor
    }
    
    func prepareForDiscoverItem(with model: TitleViewModel) {
        
        if let url = URL(string: "https://image.tmdb.org/t/p/w500\(model.posterURL)") {
            posterImage.kf.setImage(with: url)
        }
        
        titleLabel.text = model.titleName
    }
    
}
