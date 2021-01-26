//
//  FavoriteButton.swift
//  FRSeatGeekiOSExercise
//
//  Created by Brandon Baker on 1/24/21.
//

import UIKit
import AwesomeEnum

class FavoriteButton: UIButton {
    
    var hideIfUnfavorited: Bool
    var size: CGFloat
    var isFavorite: Bool {
        didSet {
            reloadHeartIcon()
        }
    }
    
    var heartImageView = UIImageView()
    
    init(isFavorite: Bool, size: CGFloat, hideIfUnfavorited: Bool = false) {
        self.hideIfUnfavorited = hideIfUnfavorited
        self.isFavorite = isFavorite
        self.size = size
        super.init(frame: .zero)
        
        addSubview(heartImageView)
        heartImageView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalToSuperview()
        }
        reloadHeartIcon()
    }
    
    private func reloadHeartIcon() {
        
            let solid = Awesome.Solid.heart.asImage(size: size,
                                                     color: .heartColor,
                                                     backgroundColor: .clear)
        
            let hollow = Awesome.Regular.heart.asImage(size: size,
                                                      color: hideIfUnfavorited ? .clear : .heartColor,
                                                     backgroundColor: .clear)
        
        heartImageView.image = isFavorite ? solid : hollow
        self.accessibilityIdentifier = isFavorite ? "solidHeart" : "hollowHeart"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: FavoriteObserver
extension FavoriteButton: FavoriteObserver {
    
    var uuid: String {
        return UUID().uuidString
    }
    
    func favoriteStatusDidChange(_ isFavorite: Bool) {
        self.isFavorite = isFavorite
    }
    
}
