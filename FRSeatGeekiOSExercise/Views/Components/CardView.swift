//
//  CardView.swift
//  FRSeatGeekiOSExercise
//
//  Created by Brandon Baker on 1/24/21.
//

import UIKit

class CardView: UIView {

    init() {
        super.init(frame: .zero)
        layer.cornerRadius = Theme.cornerRadius
        layer.borderWidth = Theme.borderWidth
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = Theme.shadowOpacity
        layer.shadowOffset = Theme.shadowOffset
        layer.shadowRadius = Theme.shadowRadius
        layer.borderColor = UIColor.gray.withAlphaComponent(0.3).cgColor
        backgroundColor = .primaryBackground
    }
    
    func setSelected(_ selected: Bool) {
        UIView.animate(withDuration: 0.25) {
            self.layer.shadowOpacity = selected ? Theme.shadowOpacity * 3 : Theme.shadowOpacity
            self.layer.shadowRadius = selected ? Theme.shadowRadius * 1.5 : Theme.shadowRadius
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
