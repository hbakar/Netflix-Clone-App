//
//  TitleTableViewCell.swift
//  Netflix Clone App
//
//  Created by Hüseyin BAKAR on 9.01.2024.
//

import UIKit

class TitleTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var titlePosterUIImageView: UIImageView!
    
    @IBOutlet private weak var titleLabel: UILabel!
    
    @IBOutlet private weak var playTitleButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    
}
