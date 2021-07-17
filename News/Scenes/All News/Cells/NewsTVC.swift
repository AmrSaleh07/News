//
//  NewsTVC.swift
//  News
//
//  Created by Amr Saleh on 7/17/21.
//

import UIKit

class NewsTVC: UITableViewCell {

    // MARK: - Views
    lazy var containerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = Constants.defaultCornerRadius
        view.clipsToBounds = true
        view.layer.borderColor = UIColor.News.lightGray.cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    lazy var articleImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.backgroundColor = .white
        imageView.image = #imageLiteral(resourceName: "article card")
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        var label = UILabel()
        label.textColor = .white
        label.font = UIFont.getFont(type: .bold, size: 15)
        label.numberOfLines = 2
        return label
    }()
    
    lazy var typeAndDateLabel: UILabel = {
        var label = UILabel()
        label.textColor = .white
        label.font = UIFont.getFont(type: .normal, size: 10)
        return label
    }()
    
    lazy var stackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.alignment = .fill
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(typeAndDateLabel)
        return stackView
    }()
    
    lazy var gradientView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5699111729)
        return view
    }()
}

// MARK: - Methods
extension NewsTVC {
    
    /// Display news data in the cell.
    /// - Parameter article: Data to display.
    /// - Author: Amr Saleh.
    /// - Date: 17 July 2021.
    func configureCell(article: ArticleEntity) {
        
        articleImageView.setImage(url: article.urlToImage, placeholder: #imageLiteral(resourceName: "article card"))
        titleLabel.text = article.title
        if let sourceName = article.source?.name {
            let attributedText = NSMutableAttributedString(string: sourceName, attributes: [.foregroundColor: UIColor.News.red, NSAttributedString.Key.font: UIFont.getFont(type: .bold, size: 15)])
            attributedText.append(NSAttributedString(string: "  •  \(article.publishedAt ?? "")", attributes: [.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.getFont(type: .normal, size: 15)]))
            typeAndDateLabel.attributedText = attributedText
        }
    }
}

// MARK: - BaseLayoutDelegate
extension NewsTVC: BaseLayoutDelegate {
    
    func setupViews() {
        contentView.addSubview(containerView)
        containerView.addSubviews([articleImageView, gradientView])
        gradientView.addSubview(stackView)
        
        containerView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(Constants.defaultOffset)
            make.bottom.trailing.equalToSuperview().offset(-Constants.defaultOffset)
            make.height.equalTo(200)
        }
        
        articleImageView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        gradientView.snp.makeConstraints { (make) in
            make.leading.equalToSuperview()
            make.trailing.bottom.equalToSuperview()
        }
        
        stackView.snp.makeConstraints { (make) in
            make.leading.top.equalToSuperview().offset(8)
            make.bottom.trailing.equalToSuperview().offset(-8)
        }
    }
}
