//
//  ViewController.swift
//  demo
//
//  Created by Rystem Asqar on 7/4/23.
//

import UIKit
import SnapKit
import Firebase
import FirebaseDatabase

class ViewController: UIViewController {
    
    
    
    lazy private var imageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "img")
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor.black.cgColor, UIColor.clear.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        image.layer.addSublayer(gradientLayer)
        return image
    }()
    lazy private var buttonView: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Let's start collecting", for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.backgroundColor = .white
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 10
        return button
    }()
    lazy private var labelView: UILabel = {
        let label = UILabel()
        label.text = "Save all interesting \nlinks in one app"
        label.font = UIFont.boldSystemFont (ofSize: 40)
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 2
        return label
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        setupViews()
        setupConstraints()
        
        
        
    }
    func setupViews() {
        view.addSubview(imageView)
        view.addSubview(buttonView)
        view.addSubview(labelView)
    }
    func setupConstraints() {
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        buttonView.snp.makeConstraints { make in
            make.width.equalTo(350)
            make.height.equalTo(60)
            make.bottom.equalToSuperview().inset(100)
            make.centerX.equalToSuperview()
        }
        labelView.snp.makeConstraints { make in
            make.bottom.equalTo(buttonView.snp.top).offset(-20)
            make.left.equalTo(buttonView.snp.left)
        }
    }
    
    
    
    @objc private func buttonTapped() {
        
        var nextVC = UIViewController()
        if Data.strArr.isEmpty {
            nextVC = BookMarkViewController()
        } else {
            nextVC = ListViewController()
        }
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
}

