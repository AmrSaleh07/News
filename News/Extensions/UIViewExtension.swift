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
    
    public func addTapGesture(tapNumber: Int = 1, action: ((UITapGestureRecognizer) -> Void)?) {
        let tap = BlockTap(tapCount: tapNumber, fingerCount: 1, action: action)
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(tap)
    }
}

private class BlockTap: UITapGestureRecognizer {
    
    private var tapAction: ((UITapGestureRecognizer) -> Void)?
    
    override init(target: Any?, action: Selector?) {
        super.init(target: target, action: action)
    }
    
    convenience init (tapCount: Int = 1, fingerCount: Int = 1, action: ((UITapGestureRecognizer) -> Void)?) {
        self.init()
        self.numberOfTapsRequired = tapCount
        self.numberOfTouchesRequired = fingerCount
        self.tapAction = action
        self.addTarget(self, action: #selector(BlockTap.didTap(_:)))
    }
    
    @objc func didTap (_ tap: UITapGestureRecognizer) {
        tapAction?(tap)
    }
}
