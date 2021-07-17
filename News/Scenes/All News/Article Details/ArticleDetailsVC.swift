//
//  ArticleDetailsVC.swift
//  News
//
//  Created by Amr Saleh on 7/17/21.
//

import UIKit

class ArticleDetailsVC: UIViewController {

    var layout: ArticleDetailsLayout!
    var article: ArticleEntity!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        layout = ArticleDetailsLayout(superview: self.view)
        layout.setupViews()
        layout.tableView.dataSource = self
        layout.tableView.delegate = self
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate
extension ArticleDetailsVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ArticleDetailsTVC.reusedIdentifier) as! ArticleDetailsTVC
        cell.setupViews()
        cell.configureCell(article: self.article)
        cell.sourceLinkImageView.addTapGesture { [weak self] (_) in
            UIHelper.openExternalLinks(sourceURL: self?.article.url ?? "")
        }
        return cell
    }
}
