//
//  AddFoodView.swift
//  VoyatekGroupiOSTask
//
//  Created by Danjuma Nasiru on 20/02/2025.
//

import Foundation
import UIKit

class AddFoodView: UIView {
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var pictureStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    var cameraStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 5
        stackView.layer.borderWidth = 1
        stackView.layer.borderColor = UIColor.lightGray.cgColor
        stackView.layer.cornerRadius = 5
        stackView.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    var uploadStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 5
        stackView.layer.borderWidth = 1
        stackView.layer.borderColor = UIColor.lightGray.cgColor
        stackView.layer.cornerRadius = 5
        stackView.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    var cameraIcon: UIImageView = {
        let icon = UIImageView(image: UIImage(named: "camera"))
        icon.isUserInteractionEnabled = true
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()
    
    var uploadIcon: UIImageView = {
        let icon = UIImageView(image: UIImage(named: "upload-icon"))
        icon.isUserInteractionEnabled = true
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()
    
    var nameStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    var nameField: PaddedTextField = {
        let field = PaddedTextField()
        field.placeholder = "Enter food name"
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.layer.borderWidth = 1
        field.layer.cornerRadius = 5
        field.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    var descriptionStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    var descriptionField: UITextView = {
        let field = UITextView()
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.layer.borderWidth = 1
        field.layer.cornerRadius = 5
        field.textContainerInset = UIEdgeInsets(top: 10, left: 8, bottom: 10, right: 8)
        field.isScrollEnabled = true
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    var categoryStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    var categoryField: PaddedTextField = {
        let field = PaddedTextField()
        field.placeholder = "category"
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.layer.borderWidth = 1
        field.layer.cornerRadius = 5
        let img = UIImageView(image: UIImage(systemName: "chevron.down")?.withRenderingMode(.alwaysTemplate))
        img.tintColor = .black
        field.rightView = img
        field.rightViewMode = .always
        field.isUserInteractionEnabled = true
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    var caloriesStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    var caloriesField: PaddedTextField = {
        let field = PaddedTextField()
        field.placeholder = "Enter number of calories"
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.layer.borderWidth = 1
        field.layer.cornerRadius = 5
        field.keyboardType = .numberPad
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    var tagStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fill
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let tagInputField = TagInputView()
    
    let submitButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Add food", for: .normal)
        button.backgroundColor = .faintBlue
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 10
        button.isEnabled = false
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(pictureStack)
        contentView.addSubview(nameStack)
        contentView.addSubview(descriptionStack)
        contentView.addSubview(categoryStack)
        contentView.addSubview(caloriesStack)
        contentView.addSubview(tagStack)
        contentView.addSubview(submitButton)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
        let cameraLabel = UILabel()
        cameraLabel.text = "Take photo"
        cameraLabel.font = .systemFont(ofSize: 12, weight: .light)
        
        let uploadLabel = UILabel()
        uploadLabel.text = "Upload"
        uploadLabel.font = .systemFont(ofSize: 12, weight: .light)
        
        NSLayoutConstraint.activate([
            cameraIcon.widthAnchor.constraint(equalToConstant: 30),
            cameraIcon.heightAnchor.constraint(equalToConstant: 30),
            uploadIcon.widthAnchor.constraint(equalToConstant: 30),
            uploadIcon.heightAnchor.constraint(equalToConstant: 30)
        ])
        cameraStack.addArrangedSubview(cameraIcon)
        cameraStack.addArrangedSubview(cameraLabel)
        
        uploadStack.addArrangedSubview(uploadIcon)
        uploadStack.addArrangedSubview(uploadLabel)
        
        pictureStack.addArrangedSubview(cameraStack)
        pictureStack.addArrangedSubview(uploadStack)
        
        NSLayoutConstraint.activate([
            pictureStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 25),
            pictureStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 18),
            pictureStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -18),
            pictureStack.heightAnchor.constraint(equalToConstant: 80)
        ])
        
        let nameLbl = UILabel()
        nameLbl.text = "Name"
        nameLbl.font = .systemFont(ofSize: 12, weight: .semibold)
        
        let descriptionLbl = UILabel()
        descriptionLbl.text = "Description"
        descriptionLbl.font = .systemFont(ofSize: 12, weight: .semibold)
        
        let categoryLbl = UILabel()
        categoryLbl.text = "Category"
        categoryLbl.font = .systemFont(ofSize: 12, weight: .semibold)
        
        let caloriesLbl = UILabel()
        caloriesLbl.text = "Calories"
        caloriesLbl.font = .systemFont(ofSize: 12, weight: .semibold)
        
        let tagLbl = UILabel()
        tagLbl.text = "Tags"
        tagLbl.font = .systemFont(ofSize: 12, weight: .semibold)
        
        NSLayoutConstraint.activate([
            nameStack.topAnchor.constraint(equalTo: pictureStack.bottomAnchor, constant: 40),
            nameStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 18),
            nameStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -18),
            
            descriptionStack.topAnchor.constraint(equalTo: nameStack.bottomAnchor, constant: 15),
            descriptionStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 18),
            descriptionStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -18),
            
            categoryStack.topAnchor.constraint(equalTo: descriptionStack.bottomAnchor, constant: 15),
            categoryStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 18),
            categoryStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -18),
            
            caloriesStack.topAnchor.constraint(equalTo: categoryStack.bottomAnchor, constant: 15),
            caloriesStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 18),
            caloriesStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -18),
            
            tagStack.topAnchor.constraint(equalTo: caloriesStack.bottomAnchor, constant: 15),
            tagStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 18),
            tagStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -18),
            
            submitButton.heightAnchor.constraint(equalToConstant: 54),
            submitButton.topAnchor.constraint(equalTo: tagStack.bottomAnchor, constant: 60),
            submitButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 18),
            submitButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -18),
            submitButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -50),
            
            nameField.heightAnchor.constraint(equalToConstant: 35),
            descriptionField.heightAnchor.constraint(equalToConstant: 120),
            categoryField.heightAnchor.constraint(equalToConstant: 35),
            caloriesField.heightAnchor.constraint(equalToConstant: 35),
        ])
        
        nameStack.addArrangedSubview(nameLbl)
        nameStack.addArrangedSubview(nameField)
        
        descriptionStack.addArrangedSubview(descriptionLbl)
        descriptionStack.addArrangedSubview(descriptionField)
        
        categoryStack.addArrangedSubview(categoryLbl)
        categoryStack.addArrangedSubview(categoryField)
        
        caloriesStack.addArrangedSubview(caloriesLbl)
        caloriesStack.addArrangedSubview(caloriesField)
        
        tagStack.addArrangedSubview(tagLbl)
        tagStack.addArrangedSubview(tagInputField)
        
        NSLayoutConstraint.activate([
            nameField.leadingAnchor.constraint(equalTo: nameStack.leadingAnchor),
            nameField.trailingAnchor.constraint(equalTo: nameStack.trailingAnchor),
            
            descriptionField.leadingAnchor.constraint(equalTo: descriptionStack.leadingAnchor),
            descriptionField.trailingAnchor.constraint(equalTo: descriptionStack.trailingAnchor),
            
            categoryField.leadingAnchor.constraint(equalTo: categoryStack.leadingAnchor),
            categoryField.trailingAnchor.constraint(equalTo: categoryStack.trailingAnchor),
            
            caloriesField.leadingAnchor.constraint(equalTo: caloriesStack.leadingAnchor),
            caloriesField.trailingAnchor.constraint(equalTo: caloriesStack.trailingAnchor),
            
            tagInputField.leadingAnchor.constraint(equalTo: tagStack.leadingAnchor),
            tagInputField.trailingAnchor.constraint(equalTo: tagStack.trailingAnchor)
        ])
    }
}
