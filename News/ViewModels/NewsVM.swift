//
//  NewsVM.swift
//  News
//
//  Created by Amr Saleh on 7/17/21.
//

import Foundation
import RxCocoa

class NewsVM {
    
    var didFetchArticles﻿Subject = BehaviorRelay<Bool>(value: false)
    var articles: [ArticleEntity] = []
    var isMoreDataAvailable = true
    var isRefreshingData = false
    
    func getALlNews(page: Int, searchTerm: String) {
        UIHelper.showActivityIndicator()
        NetworkProvider.request(for: .allNews(page: page, searchTerm: searchTerm), responseType: APIResponseDataArray<ArticleEntity>.self) { [weak self] (_, response, _) in
            guard let self = self else { return }
            if response != nil && response!.articles != nil {
                ///Check if we are refreshing the data or loading more data (paginations).
                if self.isRefreshingData {
                    self.articles = response!.articles!
                } else {
                    self.articles.append(contentsOf: response!.articles!)
                }
                
                ///Check if more data (pages) are available.
                if response!.articles!.count < Constants.perPage {
                    self.isMoreDataAvailable = false
                }
                
            } else {
                self.articles = response?.articles ?? []
            }

            self.didFetchArticles﻿Subject.accept(true)
            self.isRefreshingData = false
            UIHelper.hideActivityIndicator()
        }
    }
}
