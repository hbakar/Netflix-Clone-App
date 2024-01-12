//
//  DetailItemCell.swift
//  Netflix Clone App
//
//  Created by Hüseyin BAKAR on 12.01.2024.
//

import UIKit

protocol DetailItemCellDelegate: AnyObject {
    
    func didClickedCloseButton()
    
}


class DetailItemCell: UITableViewCell {

    @IBOutlet weak var buttonClose: UIButton!
    
    weak var delegate: DetailItemCellDelegate?
    
    var indexPath: IndexPath?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    @IBAction func buttonCloseClicked(_ sender: Any) {
        delegate?.didClickedCloseButton()
    }
    
}
