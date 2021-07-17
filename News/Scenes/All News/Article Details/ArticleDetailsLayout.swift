//
//  ArticleDetailsLayout.swift
//  News
//
//  Created by Amr Saleh on 7/17/21.
//

import UIKit

class ArticleDetailsLayout: BaseLayout {
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.register(ArticleDetailsTVC.self, forCellReuseIdentifier: ArticleDetailsTVC.reusedIdentifier)
        return tableView
    }()
}

extension ArticleDetailsLayout: BaseLayoutDelegate {
    func setupViews() {
        superview.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}
