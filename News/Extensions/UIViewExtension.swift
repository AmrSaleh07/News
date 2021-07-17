//
//  UIViewExtension.swift
//  News
//
//  Created by Amr Saleh on 7/17/21.
//

import UIKit

extension UIView {
    public func addSubviews(_ views: [UIView]) {
        views.forEach { [weak self] eachView in
            self?.addSubview(eachView)
        }
    }
}
