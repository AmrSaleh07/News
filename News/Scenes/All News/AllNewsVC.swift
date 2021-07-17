//
//  AllNewsVC.swift
//  News
//
//  Created by Amr Saleh on 7/17/21.
//

import UIKit
import RxSwift

class AllNewsVC: UIViewController {

    // MARK: - Properties
    var layout: AllNewsLayout!
    var newsVM: NewsVM!
    var disposeBag = DisposeBag()
    var page = 1
    var searchTerm = "BitCoin"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout = AllNewsLayout(superview: self.view)
        layout.setupViews()
        layout.tableView.dataSource = self
        layout.tableView.delegate = self
        layout.searchBar.text = searchTerm
        layout.refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        layout.searchBar.delegate = self
        refreshData()
        setupRX()
        self.title = "All News"
    }
}

// MARK: - Methods
extension AllNewsVC {
    
    /// Refresh layout components.
    /// - Author: Amr Saleh.
    /// - Date: 17 July 2021.
    @objc func refreshData() {
        page = 1
        newsVM.isRefreshingData = true
        newsVM.isMoreDataAvailable = true
        newsVM.getALlNews(page: page, searchTerm: searchTerm)
    }
    
    /// Load more news from API.
    /// - Author: Amr Saleh.
    /// - Date: 17 July 2021.
    func loadMoreData() {
        page += 1
        newsVM.getALlNews(page: page, searchTerm: searchTerm)
    }
    
    /// Setup the RX and binding for layout components.
    /// - Author: Amr Saleh.
    /// - Date: 17 July 2021.
    func setupRX() {

        newsVM.didFetchArticles﻿Subject.asDriver().filter({$0}).drive(onNext: { [weak self] _ in
            self?.layout.refreshControl.endRefreshing()
            self?.layout.tableView.tableFooterView?.isHidden = true
            self?.layout.tableView.reloadData()
        }).disposed(by: disposeBag)
    }
    
    func hideKeyboard() {
        self.view.endEditing(true)
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate
extension AllNewsVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsVM.articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsTVC.reusedIdentifier) as! NewsTVC
        cell.setupViews()
        cell.selectionStyle = .none
        cell.configureCell(article: newsVM.articles[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigationController?.pushViewController(instantiateVC(.articleDetails(article: newsVM.articles[indexPath.row])), animated: true)
    }
}

// MARK: - UIScrollViewDelegate
extension AllNewsVC: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if scrollView == layout.tableView && (scrollView.contentOffset.y + scrollView.frame.size.height) >= scrollView.contentSize.height {
            if newsVM.isMoreDataAvailable {
                loadMoreData()
            }
            layout.tableView.tableFooterView?.isHidden = !newsVM.isMoreDataAvailable
        }
    }
}

// MARK: - UISearchBarDelegate
extension AllNewsVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.searchTerm = searchText.isEmpty ? "BitCoin" : searchText
        self.refreshData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.hideKeyboard()
    }
}
