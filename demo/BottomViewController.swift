//
//  BottomViewController.swift
//  demo
//
//  Created by Rystem Asqar on 7/23/23.
//

import UIKit
import SnapKit
import Firebase
import FirebaseDatabase


class BottomViewController: UIViewController {
    
    var ref: DatabaseReference!
    
    
    
    lazy private var titleView: UILabel = {
        let label = UILabel()
        label.text = "Title"
        label.font = UIFont.boldSystemFont (ofSize: 40)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    lazy private var linkView: UILabel = {
        let label = UILabel()
        label.text = "Link"
        label.font = UIFont.boldSystemFont (ofSize: 40)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    var textField1: UITextField = {
        let text = UITextField()
        text.placeholder = "type a title"
        text.layer.cornerRadius = 10
        text.layer.borderWidth = 1.0 // Set the width of the border
        text.layer.borderColor = UIColor.black.cgColor
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        text.leftView = leftView
        text.leftViewMode = .always
        return text
    }()
    var textField2: UITextField = {
        let text = UITextField()
        text.placeholder = "type a link"
        text.layer.cornerRadius = 10
        text.layer.borderWidth = 1.0 // Set the width of the border
        text.layer.borderColor = UIColor.black.cgColor
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        text.leftView = leftView
        text.leftViewMode = .always
        text.autocapitalizationType = .none
        return text
    }()
    lazy private var buttonView: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Submit", for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.backgroundColor = .black
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        return button
    }()
    lazy private var textView: UITextView = {
        let text = UITextView()
        text.text = "Here you can save all your links in one bookMark"
        text.font = UIFont.boldSystemFont(ofSize: 16)
        return text
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        ref = Database.database().reference()
        fetchDataAndSaveToDictionary()
        
        setupViews()
        setupConstraints()
        
    }
    
    func setupViews() {
        view.addSubview(titleView)
        view.addSubview(linkView)
        view.addSubview(textField1)
        view.addSubview(textField2)
        view.addSubview(buttonView)
        view.addSubview(textView)
    }
    func setupConstraints() {
        titleView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.left.equalToSuperview().offset(20)
        }
        textField1.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.width.equalTo(350)
            make.top.equalTo(titleView.snp.bottom).offset(10)
            make.left.equalTo(titleView.snp.left)
        }
        linkView.snp.makeConstraints { make in
            make.top.equalTo(textField1.snp.bottom).offset(20)
            make.left.equalTo(titleView.snp.left)
        }
        textField2.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.width.equalTo(350)
            make.top.equalTo(linkView.snp.bottom).offset(10)
            make.left.equalTo(titleView.snp.left)
        }
        textView.snp.makeConstraints { make in
            make.width.equalTo(350)
            make.height.equalTo(50)
            make.top.equalTo(textField2.snp.bottom).offset(20)
            make.left.equalTo(titleView.snp.left)
        }
        buttonView.snp.makeConstraints { make in
            make.width.equalTo(350)
            make.height.equalTo(60)
            make.bottom.equalToSuperview().inset(50)
            make.centerX.equalToSuperview()
        }
    }
    
    @objc private func buttonTapped() {
        guard let value = textField2.text, !value.isEmpty,
              let key = textField1.text, !key.isEmpty else {
            // Ensure both text fields have data; otherwise, don't proceed
            return
        }
        
        // Save the data to Firebase
        saveDataToFirebase(value: value, key: key)
        
        let nextVC = ListViewController()
        //        navigationController?.pushViewController(ListViewController, animated: true)
        present(nextVC, animated: true, completion: nil)
        //        self.pushViewController(nextVC, animated: true)
        //        nextVC.modalPresentationStyle = .fullScreen
        
    }
    
    func saveDataToFirebase(value: String, key: String) {
        // Create a dictionary with the key-value pair to be saved
        let data: [String: Any] = [key: value]
        
        // Save the data to the Firebase Database
        ref.child("BookMarkLinks").updateChildValues(data) { error, _ in
            if let error = error {
                print("Error saving data to Firebase: \(error)")
            } else {
                print("Data saved successfully!")
                // Clear the text fields after saving
                self.textField1.text = ""
                self.textField2.text = ""
            }
        }
    }
    
    func fetchDataAndSaveToDictionary() {
        ref.child("BookMarkLinks").observeSingleEvent(of: .value) { (snapshot) in
            if let data = snapshot.value as? [String: String] {
                // Save the data to the dictionary
                Data.dataDictionary = data
                Data.strArr = Array(data.keys)
                print("Data saved to dictionary:", Data.dataDictionary)
            } else {
                print("No data found.")
            }
        }
    }
}
