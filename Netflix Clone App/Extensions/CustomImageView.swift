//
//  CustomImageView.swift
//  Netflix Clone App
//
//  Created by Hüseyin BAKAR on 12.01.2024.
//

import UIKit

@IBDesignable
class CustomImageView: UIImageView {
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.cornerCurve = .continuous
            layer.masksToBounds = true
        }
    }
}
