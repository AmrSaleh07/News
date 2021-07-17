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
}

// MARK: - Methods
extension NewsTVC {
    
    /// Display story, news or event data in the cell.
    /// - Parameter item: Data to display.
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
        applyGradient()
    }
    
    /// Apply gradient to cell.
    /// - Author: Amr Saleh.
    /// - Date: 28 Jun 2021.
    private func applyGradient() {
        if (articleImageView.layer.sublayers ?? []).isEmpty {
            let layer = UIHelper.applyGradient(frame: self.bounds, locations: [0, 1], startPoint: CGPoint(x: 0.5, y: 1), endPoint: CGPoint(x: 0.5, y: 0), colors: [#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.4960998131).cgColor, #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.08285219306).cgColor])
            articleImageView.layer.insertSublayer(layer, at: 0)
        }
    }
}

// MARK: - BaseLayoutDelegate
extension NewsTVC: BaseLayoutDelegate {
    
    func setupViews() {
        contentView.addSubview(containerView)
        containerView.addSubviews([articleImageView, stackView])
        
        
        containerView.snp.makeConstraints { (make) in
            make.top.leading.equalToSuperview().offset(Constants.defaultOffset)
            make.trailing.equalToSuperview().offset(-Constants.defaultOffset)
            make.bottom.equalToSuperview()
            make.height.equalTo(200)
        }
        
        articleImageView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        stackView.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(16)
            make.trailing.bottom.equalToSuperview().offset(-16)
        }
    }
}
