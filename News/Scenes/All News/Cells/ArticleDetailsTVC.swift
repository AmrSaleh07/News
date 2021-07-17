//
//  ArticleDetailsTVC.swift
//  News
//
//  Created by Amr Saleh on 7/17/21.
//

import UIKit

class ArticleDetailsTVC: UITableViewCell {
    
    lazy var articleImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.backgroundColor = .white
        imageView.image = #imageLiteral(resourceName: "article card")
        return imageView
    }()
    
    lazy var sourceLabel: UILabel = {
        var label = UILabel()
        label.textColor = UIColor.News.blue
        label.font = UIFont.getFont(type: .bold, size: 17)
        return label
    }()
    
    lazy var sourceLinkImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "external-link")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var sourceStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.addArrangedSubview(sourceLabel)
        stackView.addArrangedSubview(sourceLinkImageView)
        return stackView
    }()
    
    lazy var authorLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont.getFont(type: .bold, size: 17)
        return label
    }()
    
    lazy var dateLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont.getFont(type: .normal, size: 17)
        return label
    }()
    
    lazy var sepratorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.News.lightGray
        return view
    }()
    
    lazy var authorStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.addArrangedSubview(authorLabel)
        stackView.addArrangedSubview(dateLabel)
        stackView.addArrangedSubview(sepratorView)
        return stackView
    }()
    
    lazy var titleLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont.getFont(type: .bold, size: 21)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont.getFont(type: .bold, size: 15)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var contentLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont.getFont(type: .normal, size: 17)
        label.numberOfLines = 0
        label.textColor = UIColor.News.darkGray
        return label
    }()
    
    lazy var contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(descriptionLabel)
        stackView.addArrangedSubview(contentLabel)
        return stackView
    }()
}

// MARK: - Methods
extension ArticleDetailsTVC {
    
    /// Display news data in the cell.
    /// - Parameter article: Data to display.
    /// - Author: Amr Saleh.
    /// - Date: 17 July 2021.
    func configureCell(article: ArticleEntity) {
        articleImageView.setImage(url: article.urlToImage, placeholder: #imageLiteral(resourceName: "article card"))
        sourceLabel.text = article.source?.name
        authorLabel.text = "Author:" + " " + "\(article.author ?? "")"
        dateLabel.text = article.publishedAt
        titleLabel.text = article.title
        descriptionLabel.text = article.descriptionField
        contentLabel.text = article.content
    }
}

extension ArticleDetailsTVC: BaseLayoutDelegate {
    func setupViews() {
        contentView.addSubviews([articleImageView,sourceStackView,authorStackView,contentStackView])
        
        articleImageView.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(250)
        }
        
        sourceLinkImageView.snp.makeConstraints { (make) in
            make.width.height.equalTo(Constants.defaultIconSize)
        }
        
        sourceStackView.snp.makeConstraints { (make) in
            make.top.equalTo(articleImageView.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(Constants.defaultOffset)
            make.trailing.equalToSuperview().offset(-Constants.defaultOffset)
            make.height.equalTo(25)
        }
        
        sepratorView.snp.makeConstraints { (make) in
            make.height.equalTo(1)
        }
        
        authorStackView.snp.makeConstraints { (make) in
            make.top.equalTo(sourceStackView.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(Constants.defaultOffset)
            make.trailing.equalToSuperview().offset(-Constants.defaultOffset)
        }
        
        contentStackView.snp.makeConstraints { (make) in
            make.top.equalTo(authorStackView.snp.bottom).offset(Constants.defaultOffset)
            make.leading.equalToSuperview().offset(Constants.defaultOffset)
            make.bottom.trailing.equalToSuperview().offset(-Constants.defaultOffset)
        }
    }
}
