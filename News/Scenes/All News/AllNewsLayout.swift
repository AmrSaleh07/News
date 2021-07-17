//
//  AllNewsLayout.swift
//  News
//
//  Created by Amr Saleh on 7/17/21.
//

import UIKit
import SnapKit

class AllNewsLayout: BaseLayout {
    
    lazy var searchBar:UISearchBar = {
        var searchBar = UISearchBar()
        searchBar.searchBarStyle = .minimal
        searchBar.tintColor = .darkGray
        searchBar.placeholder = "Search"
        searchBar.layer.cornerRadius = 10
        searchBar.clipsToBounds = true
        return searchBar
    }()
    
    lazy var refreshControl: UIRefreshControl = {
        var refreshControl = UIRefreshControl()
        return refreshControl
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        let spinner = UIActivityIndicatorView(style: .medium)
        spinner.startAnimating()
        spinner.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: CGFloat(45), height: CGFloat(45))
        tableView.tableFooterView = spinner
        tableView.tableFooterView?.isHidden = true
        tableView.register(NewsTVC.self, forCellReuseIdentifier: NewsTVC.reusedIdentifier)
        return tableView
    }()
}

extension AllNewsLayout: BaseLayoutDelegate {
    func setupViews() {
        superview.addSubviews([searchBar,tableView])
        tableView.addSubview(refreshControl)
        
        searchBar.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
        }
        
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(searchBar.snp.bottom)
            make.bottom.leading.trailing.equalToSuperview()
        }
    }
}
