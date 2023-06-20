//
//  RoundedImageView.swift
//  Phone Book
//
//  Created by Nataliia Shusta on 20/06/2023.
//
import UIKit

class RoundedImageView: UIImageView {
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = bounds.width / 2
        clipsToBounds = true
    }
}
