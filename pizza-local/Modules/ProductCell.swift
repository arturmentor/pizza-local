//
//  ProductCell.swift
//  pizza-local
//
//  Created by Artur Igberdin on 20.01.2024.
//

import UIKit

final class ProductCell: UITableViewCell {
    
    static let reuseId = "ProductCell"
    
    private var productImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.image = UIImage(named: "default")
        imageView.contentMode = .scaleAspectFill
        let width = UIScreen.main.bounds.width
        imageView.backgroundColor = .orange
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        imageView.heightAnchor.constraint(equalToConstant: 0.35 * width).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 0.35 * width).isActive = true
        return imageView
    }()
    
    private var nameLabel: UILabel = {
        var label = UILabel()
        label.text = "Маргарита"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    private var descriptionLabel: UILabel = {
        var label = UILabel()
        label.text = "Томаты, Тесто, Сыр"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    private var priceButton: UIButton = {
        var button = UIButton()
        button.setTitle("600р", for: .normal)
        button.backgroundColor = .orange.withAlphaComponent(0.5)
        button.layer.cornerRadius = 8
        button.setTitleColor(.brown, for: .normal)
        button.contentEdgeInsets = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
        return button
    }()
    
    private var verticalStackView: UIStackView = {
        var stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.alignment = .leading
        
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 16, leading: 8, bottom: 16, trailing: 8)
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension ProductCell {
    func setupViews() {
        contentView.addSubview(nameLabel)
        
        [productImageView, verticalStackView].forEach {
            contentView.addSubview($0)
        }
        
        [nameLabel, descriptionLabel, priceButton].forEach {
            verticalStackView.addArrangedSubview($0)
        }
    }
    
    func setupConstraints() {
        
        productImageView.snp.makeConstraints { make in
            make.top.left.equalTo(contentView).offset(16)
            make.centerY.equalTo(contentView)
        }
        
        verticalStackView.snp.makeConstraints { make in
            make.top.right.bottom.equalTo(contentView).inset(16)
            make.left.equalTo(productImageView.snp.right).offset(8)
        }
    }
}
