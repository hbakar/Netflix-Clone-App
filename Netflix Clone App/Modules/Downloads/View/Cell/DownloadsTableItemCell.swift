//
//  DownloadsTableItemCell.swift
//  Netflix Clone App
//
//  Created by Hüseyin BAKAR on 9.01.2024.
//

import UIKit
import Kingfisher


class DownloadsTableItemCell: UITableViewCell {
    
    @IBOutlet private weak var titlePosterUIImageView: UIImageView!
    
    @IBOutlet private weak var titleLabel: UILabel!
    
    @IBOutlet private weak var playTitleButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        titlePosterUIImageView.layer.cornerRadius = 12
        titlePosterUIImageView.layer.borderWidth = 1
        titlePosterUIImageView.layer.borderColor = UIColor(white: 0.95, alpha: 1).cgColor
        
    }
    
    func prepareForDownloadsItem(with model: TitleViewModel) {
        
        if let url = URL(string: "https://image.tmdb.org/t/p/w500\(model.posterURL)") {
            titlePosterUIImageView.kf.setImage(with: url)
        }
        
        titleLabel.text = model.titleName
    }
    
}
