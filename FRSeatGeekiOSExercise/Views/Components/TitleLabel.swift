//
//  TitleLabel.swift
//  FRSeatGeekiOSExercise
//
//  Created by Brandon Baker on 1/24/21.
//

import UIKit

class TitleLabel: UILabel {

    init(_ text: String?, size: CGFloat = 21, numberOfLines: Int = 2) {
        super.init(frame: .zero)
        self.text = text
        self.numberOfLines = numberOfLines
        self.font = .systemFont(ofSize: size, weight: .bold)
        self.textColor = .primaryLabel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
