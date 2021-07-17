//
//  ReusableView.swift
//  News
//
//  Created by Amr Saleh on 7/17/21.
//

import UIKit

protocol ReusableView {
    static var reusedIdentifier:String {get}
}

extension ReusableView {
    /// Creates a reused identifier with the same name for the class name that implements this protocol.
    ///
    /// - Example:
    ///   print(MyUITableViewCell.reusedIdentifier) -> **Output**: MyUITableViewCell
    ///
    static var reusedIdentifier:String {return String(describing: Self.self)}
}

extension UITableViewCell:ReusableView {}

extension UICollectionViewCell:ReusableView {}
