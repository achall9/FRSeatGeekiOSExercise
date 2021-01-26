//
//  UIImageView.swift
//  FRSeatGeekiOSExercise
//
//  Created by Brandon Baker on 1/23/21.
//

import UIKit
import Kingfisher

extension UIImageView {

    func setNetworkImage(_ urlString: String?) {
        guard let urlString = urlString else { return }
        let url = URL(string: urlString)
        self.contentMode = .scaleAspectFill
        self.kf.indicatorType = .activity
        self.kf.setImage(
            with: url,
            options: [
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ])
        {
            result in
            switch result {
            case .failure(let error):
                print("Kingfisher image failed: \(error.localizedDescription) \(url?.absoluteString ?? "")")
            case .success(_):
                return
            }
        }
    }
}
