//
//  BookMarkViewController.swift
//  demo
//
//  Created by Rystem Asqar on 7/5/23.
//

import UIKit
import SnapKit

class BookMarkViewController: UIViewController {
    
    var count = Data.sizeOfDictionary
    
    lazy private var labelView: UILabel = {
        let label = UILabel()
        label.text = "Save your firts \nBookMark here.."
        label.numberOfLines = 2
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 30)
        
        return label
    }()
    lazy private var buttonView: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Add BookMark", for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.backgroundColor = .black
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.black
        ]
        navigationController?.navigationBar.titleTextAttributes = attributes
        navigationItem.title = "BookMark App"
        navigationItem.hidesBackButton = true
        
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        
        view.addSubview(labelView)
        view.addSubview(buttonView)
    }
    func setupConstraints() {
        labelView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        buttonView.snp.makeConstraints { make in
            make.width.equalTo(350)
            make.height.equalTo(60)
            make.bottom.equalToSuperview().offset(-50)
            make.centerX.equalToSuperview()
        }
    }
    
    
    
    let vc = BottomViewController()
    @objc private func buttonTapped() {
        
        if let vc = vc.sheetPresentationController {
            vc.detents = [.medium()]
        }
        
        self.present(vc, animated: true, completion: nil)
        
    }
    
}
