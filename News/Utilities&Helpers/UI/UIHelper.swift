//
//  UIHelper.swift
//  News
//
//  Created by Amr Saleh on 7/17/21.
//

import UIKit
import NVActivityIndicatorView

class UIHelper {
    /// shows activity indicator while loading the data from API.
    class func showActivityIndicator() {
        let activityData = ActivityData(size: nil, message: nil, messageFont: nil, messageSpacing: nil, type: .ballRotateChase,
                                        color: UIColor.red, padding: nil, displayTimeThreshold: nil, minimumDisplayTime: nil, backgroundColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.24)
                                        , textColor: nil)
        NVActivityIndicatorPresenter.sharedInstance.startAnimating(activityData, nil)
    }
    
    /// Hide the activity indicator after loading the data from API.
    class func hideActivityIndicator() {
        DispatchQueue.main.async {
            NVActivityIndicatorPresenter.sharedInstance.stopAnimating(nil)
        }
    }
    
    class func applyGradient(frame: CGRect, locations: [NSNumber], startPoint: CGPoint, endPoint: CGPoint, colors: [CGColor]) -> CAGradientLayer {
        let layer = CAGradientLayer()
        layer.frame = frame
        layer.locations = locations
        layer.startPoint = startPoint
        layer.endPoint = endPoint
        layer.colors = colors
        return layer
    }
    
    class func openExternalLinks(sourceURL: String) {
        let application = UIApplication.shared
        
        if let finalUrl = URL(string: sourceURL) {
          if application.canOpenURL(finalUrl) {
             application.open(finalUrl, options: [:], completionHandler: nil)
          }
        }
    }
}
