//
//  UIImageViewExtension.swift
//  News
//
//  Created by Amr Saleh on 7/17/21.
//

import UIKit
import Kingfisher

extension UIImageView {
    func setImage(url: String?, placeholder: UIImage? = nil) {
        self.kf.setImage(with: URL(string: url ?? ""), placeholder: placeholder)
    }
}
