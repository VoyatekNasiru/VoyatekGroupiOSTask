//
//  TagInputView.swift
//  VoyatekGroupiOSTask
//
//  Created by Danjuma Nasiru on 20/02/2025.
//

import Foundation
import UIKit

protocol TagInputDelegate {
    func getTags(tags: [String]) -> Void
}

class TagInputView: UIView, UITextFieldDelegate {
    var delegate: TagInputDelegate?
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 8
        stack.alignment = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.layoutMargins = UIEdgeInsets(top: 5, left: 8, bottom: 5, right: 8)
        stack.isLayoutMarginsRelativeArrangement = true
        return stack
    }()
    
    private let textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Type a tag..."
        textField.borderStyle = .none
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    var tags: [String] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(scrollView)
        scrollView.addSubview(stackView)
        
        stackView.addArrangedSubview(textField)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            scrollView.heightAnchor.constraint(equalToConstant: 40),
            
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        ])
        
        textField.delegate = self
        
        NSLayoutConstraint.activate([
            textField.widthAnchor.constraint(equalToConstant: 100),
            textField.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let text = textField.text?.trimmingCharacters(in: .whitespaces), !text.isEmpty {
            addTag(text)
            textField.text = ""
        }
        return false
    }
    
    private func addTag(_ tag: String) {
        guard !tags.contains(tag) else { return }
        
        tags.append(tag)
        
        let tagView = createTagView(with: tag)
        stackView.insertArrangedSubview(tagView, at: stackView.arrangedSubviews.count - 1)
        
        DispatchQueue.main.async {
            self.scrollView.layoutIfNeeded()
            let offsetX = max(self.scrollView.contentSize.width - self.scrollView.bounds.width, 0)
            self.scrollView.setContentOffset(CGPoint(x: offsetX, y: 0), animated: true)
        }
        
        delegate?.getTags(tags: tags)
    }
    
    private func createTagView(with text: String) -> UIView {
        let tagView = UIView()
        tagView.backgroundColor = .faintBlue
        tagView.layer.cornerRadius = 10
        tagView.translatesAutoresizingMaskIntoConstraints = false
        
        let label = UILabel()
        label.text = text
        label.font = .systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        let deleteButton = UIButton(type: .system)
        deleteButton.setTitle("✕", for: .normal)
        deleteButton.setTitleColor(.darkGray, for: .normal)
        deleteButton.titleLabel?.font = .systemFont(ofSize: 14)
        deleteButton.addTarget(self, action: #selector(removeTag(_:)), for: .touchUpInside)
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        
        tagView.addSubview(label)
        tagView.addSubview(deleteButton)
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: tagView.leadingAnchor, constant: 8),
            label.centerYAnchor.constraint(equalTo: tagView.centerYAnchor),
            
            deleteButton.leadingAnchor.constraint(equalTo: label.trailingAnchor, constant: 8),
            deleteButton.trailingAnchor.constraint(equalTo: tagView.trailingAnchor, constant: -8),
            deleteButton.centerYAnchor.constraint(equalTo: tagView.centerYAnchor),
            
            tagView.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        return tagView
    }
    
    @objc private func removeTag(_ sender: UIButton) {
        if let tagView = sender.superview {
            tagView.removeFromSuperview()
            if let label = tagView.subviews.first(where: { $0 is UILabel }) as? UILabel,
               let index = tags.firstIndex(of: label.text ?? "") {
                tags.remove(at: index)
                delegate?.getTags(tags: tags)
            }
        }
    }
}
