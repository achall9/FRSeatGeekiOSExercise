//
//  EventTableViewCell.swift
//  FRSeatGeekiOSExercise
//
//  Created by Brandon Baker on 1/23/21.
//

import UIKit
import SnapKit

class EventTableViewCell: UITableViewCell {
    
    let padding: CGFloat = 16
    
    let event: Event
    var favoriteButton: FavoriteButton!
    let card = CardView()
    
    init(_ event: Event) {
        self.event = event
        super.init(style: .default, reuseIdentifier: "EventTableViewCell")
        selectionStyle = .none
        
        let imageView = UIImageView()
        imageView.setNetworkImage(event.imageUrl)
        imageView.layer.cornerRadius = Theme.cornerRadius
        imageView.layer.masksToBounds = true
        card.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.top.left.equalToSuperview().offset(padding)
            make.width.equalToSuperview().multipliedBy(0.25)
            make.height.equalTo(imageView.snp.width)
        }
        
        let favoriteButtonSize: CGFloat = 25
        favoriteButton = FavoriteButton(isFavorite: FavoriteManager.isFavorite(event.id),
                                        size: favoriteButtonSize,
                                        hideIfUnfavorited: true)
        favoriteButton.isUserInteractionEnabled = false
        FavoriteManager.subscribe(event.id, favoriteButton)
        card.addSubview(favoriteButton)
        favoriteButton.snp.makeConstraints { make in
            make.centerX.equalTo(imageView.snp.left).offset(favoriteButtonSize / 5)
            make.centerY.equalTo(imageView.snp.top).offset(favoriteButtonSize / 5)
            make.width.height.equalTo(favoriteButtonSize)
        }
        
        let titleLabel = TitleLabel(event.short_title ?? event.title)
        card.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.top)
            make.left.equalTo(imageView.snp.right).offset(padding)
            make.right.equalToSuperview().offset(-padding)
        }
        
        let dateLabel = SubtitleLabel(event.eventDate, numberOfLines: 1)
        dateLabel.adjustsFontSizeToFitWidth = true
        card.addSubview(dateLabel)
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom)
            make.left.equalTo(titleLabel.snp.left)
            make.right.equalToSuperview().offset(-padding)
            make.bottom.lessThanOrEqualTo(imageView.snp.bottom)
        }
        
        let descriptionLabel = SubtitleLabel(event.description)
        card.addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(padding)
            make.left.equalToSuperview().offset(padding)
            make.right.equalToSuperview().offset(-padding)
        }
        
        addSubview(card)
        card.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(padding / 4)
            make.bottom.equalToSuperview().offset(-padding / 4)
            make.left.equalToSuperview().offset(padding / 2)
            make.right.equalToSuperview().offset(-padding / 2)
        }
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        card.setSelected(selected)
    }
    
    deinit {
        FavoriteManager.unsubscribe(event.id, favoriteButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
