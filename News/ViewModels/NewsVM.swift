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
    
    func getALlNews(page: Int, searchTerm: String) {
        UIHelper.showActivityIndicator()
        NetworkProvider.request(for: .allNews(page: page, searchTerm: searchTerm), responseType: APIResponseDataArray<ArticleEntity>.self) { [weak self] (_, response, _) in
            guard let self = self else { return }
            self.articles = response?.articles ?? []
            self.didFetchArticles﻿Subject.accept(true)
            UIHelper.hideActivityIndicator()
        }
    }
}
