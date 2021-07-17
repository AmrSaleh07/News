//
//  BaseLayout.swift
//  News
//
//  Created by Amr Saleh on 7/17/21.
//

import UIKit

/// Contains the default methods that should be implemented in all layouts.
@objc protocol BaseLayoutDelegate {
    
    /// Setup the views with its constrains using SnapKit.
    /// - Author: Amr Saleh.
    /// - Date: 17 Jun 2021.
    func setupViews()
}

/// Contains the default configurations for all layouts that extends from this class.
/// - Author: Amr Saleh.
/// - Date: 17 Jun 2021.
class BaseLayout {
    
    // MARK: - Properties
    
    // MARK: - Views
    var superview: UIView!
    
    // MARK: - Initialization
     init(superview: UIView) {
        self.superview = superview
        superview.backgroundColor = .white
    }
}
