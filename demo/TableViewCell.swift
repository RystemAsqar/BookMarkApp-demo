//
//  TableViewCell.swift
//  demo
//
//  Created by Rystem Asqar on 7/11/23.
//

import UIKit
import SnapKit

class TableViewCell: UITableViewCell {
    static let identifier: String = "TableViewCellIdentifier"
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    lazy var buttonView: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(openLink), for: .touchUpInside)
        return button
    }()
     var image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "square.and.arrow.up")
        image.tintColor = .black
        return image
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(buttonView)
        buttonView.addSubview(image)
    }
    func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.centerY.equalToSuperview()
        }
        buttonView.snp.makeConstraints { make in
            make.right.equalToSuperview().multipliedBy(0.95)
            make.centerY.equalToSuperview()
        }
    }
    
    @objc func openLink() {
        if let url = URL(string: Data.link) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }

    
}
