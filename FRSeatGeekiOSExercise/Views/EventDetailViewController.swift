//
//  EventDetailViewController.swift
//  FRSeatGeekiOSExercise
//
//  Created by Brandon Baker on 1/23/21.
//

import UIKit

class EventDetailViewController: UIViewController {

    var event: Event? = nil
    
    private let padding: CGFloat = 16
    private let favoriteButtonSize: CGFloat = 50
    
    var favoriteButton: FavoriteButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.accessibilityIdentifier = "EventDetailViewController"
        view.backgroundColor = .primaryBackground
        edgesForExtendedLayout = []
        
        guard let event = event else {
            self.dismiss(animated: false)
            return
        }
        
        let titleLabel = TitleLabel(event.title, size: 24, numberOfLines: 0)
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(padding)
            make.left.equalToSuperview().offset(padding)
            make.right.equalToSuperview().offset(-(padding * 2) - favoriteButtonSize)
        }
        
        
        favoriteButton = FavoriteButton(isFavorite: FavoriteManager.isFavorite(event.id),
                                            size: favoriteButtonSize)
        favoriteButton.addTarget(self, action: #selector(didTapFavoriteButton), for: .touchUpInside)
        FavoriteManager.subscribe(event.id, favoriteButton)
        view.addSubview(favoriteButton)
        favoriteButton.snp.makeConstraints { make in
            make.centerY.equalTo(titleLabel)
            make.right.equalToSuperview().offset(-padding)
            make.width.height.equalTo(favoriteButtonSize)
        }
        
        
        let imageView = UIImageView()
        imageView.setNetworkImage(event.imageUrl)
        imageView.layer.cornerRadius = Theme.cornerRadius
        imageView.layer.masksToBounds = true
        view.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(padding)
            make.height.equalToSuperview().multipliedBy(0.4)
            make.left.equalToSuperview().offset(padding)
            make.right.equalToSuperview().offset(-padding)
        }
        
        let dateLabel = SubtitleLabel(event.eventDate, size: 20)
        view.addSubview(dateLabel)
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(padding)
            make.left.equalToSuperview().offset(padding)
            make.right.equalToSuperview().offset(-padding)
        }
        
        let descriptionLabel = SubtitleLabel(event.description, numberOfLines: 0)
        view.addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(dateLabel.snp.bottom).offset(padding / 2)
            make.left.equalToSuperview().offset(padding)
            make.right.equalToSuperview().offset(-padding)
        }
        
    }
    
    deinit {
        guard let event = event else { return }
        FavoriteManager.unsubscribe(event.id, favoriteButton)
    }
    
    @objc func didTapFavoriteButton() {
        guard let event = event else { return }
        FavoriteManager.pressedFavorite(for: event.id)
    }

}
