//
//  VCInstantiate.swift
//  News
//
//  Created by Amr Saleh on 7/17/21.
//

import UIKit

enum VC {
    case home
}

/// Instantiate a ViewController with it's dependencies.
///
/// - Parameter vc: Type of the desired ViewController.
/// - Returns: Instance of UIViewController.
/// - Author: Amr Saleh.
/// - Date: Jun 17, 2021.
func instantiateVC(_ vc: VC) -> UIViewController {
    
    switch vc {
    case .home:
        let vc = ViewController()
        return vc
    }
}

