//
//  SubtitleLabel.swift
//  FRSeatGeekiOSExercise
//
//  Created by Brandon Baker on 1/24/21.
//

import UIKit

class SubtitleLabel: UILabel {

    init(_ text: String?, size: CGFloat = 18, numberOfLines: Int = 3) {
        super.init(frame: .zero)
        self.text = text
        self.numberOfLines = numberOfLines
        self.font = .systemFont(ofSize: size, weight: .regular)
        self.textColor = .secondaryLabel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
