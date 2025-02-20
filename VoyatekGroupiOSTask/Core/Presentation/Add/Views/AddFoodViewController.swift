//
//  AddFoodViewController.swift
//  VoyatekGroupiOSTask
//
//  Created by Danjuma Nasiru on 19/02/2025.
//

import UIKit
import SwiftUI

class AddFoodViewController: BaseViewController, UITextViewDelegate, TagInputDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var uiControls: AddFoodView  = AddFoodView()
    var categories: [Category] = []
    let viewModel: AddFoodViewModel = AddFoodViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        showBackButton(for: "Add new food")
        
        setupUI()
        
        uiControls.descriptionField.delegate = self
        uiControls.tagInputField.delegate = self
        
        viewModel.onSuccess = { [weak self] in
            self?.hideLoader()
            self?.showSuccessAlert(message: "Food created successfully") {
                self?.dismiss(animated: true)
                self?.navigationController?.popViewController(animated: true)
            }
        }
        viewModel.onError = { [weak self] message in
            self?.hideLoader()
            self?.showErrorAlert(message: message) {
                self?.showLoader()
                self?.viewModel.createFood()
            }
        }
    }
    
    func setupUI() {
        uiControls.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(uiControls)
        NSLayoutConstraint.activate([
            uiControls.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            uiControls.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            uiControls.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            uiControls.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        uiControls.cameraIcon.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(openCamera)))
        uiControls.uploadIcon.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(openPhotoLibrary)))
        uiControls.categoryField.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(presentCategoriesSheet)))
        
        [uiControls.nameField, uiControls.categoryField, uiControls.caloriesField].forEach { field in
            field.addTarget(self, action: #selector(textFieldsDidChange), for: .editingChanged)
        }
        
        uiControls.submitButton.addTarget(self, action: #selector(createFood), for: .touchUpInside)
    }
    
    @objc func openCamera() {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            imagePicker.allowsEditing = true
            present(imagePicker, animated: true)
        } else {
            print("Camera not available")
        }
    }
    
    @objc func openPhotoLibrary() {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.allowsEditing = true
            present(imagePicker, animated: true)
        } else {
            print("Photo library not available")
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[.editedImage] as? UIImage {
            viewModel.images.append(selectedImage)
        } else if let selectedImage = info[.originalImage] as? UIImage {
            viewModel.images.append(selectedImage)
        }
        picker.dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
    
    @objc func presentCategoriesSheet() {
        let categoryView = CategoriesDropDownView(categories: categories ) { [weak self] category in
            guard let self else { return }
            viewModel.category = category.id ?? 0
            uiControls.categoryField.text = category.name
            textFieldsDidChange(uiControls.categoryField)
            dismiss(animated: true)
        }
        let categoryVC = UIHostingController(rootView: categoryView)
        categoryVC.modalPresentationStyle = .pageSheet
        if let sheet = categoryVC.sheetPresentationController {
            sheet.detents = [.medium()]
        }
        present(categoryVC, animated: true)
    }
    
    @objc private func textFieldsDidChange(_ textField: UITextField) {
        if textField == uiControls.nameField {
            viewModel.name = textField.text ?? ""
        } else if textField == uiControls.categoryField {
            viewModel.category = categories.first { $0.name == textField.text}?.id  ?? 0
        } else if textField == uiControls.caloriesField {
            viewModel.calories = Int(textField.text ?? "0") ?? 0
        }
        let isFormValid = !(uiControls.nameField.text?.isEmpty ?? true) &&
        !(uiControls.descriptionField.text?.isEmpty ?? true) &&
        !(uiControls.categoryField.text?.isEmpty ?? true) &&
        !(uiControls.caloriesField.text?.isEmpty ?? true)
        
        uiControls.submitButton.isEnabled = isFormValid
        uiControls.submitButton.backgroundColor = isFormValid ? UIColor.blue : .faintBlue
        uiControls.submitButton.setTitleColor(isFormValid ? .white : .black, for: .normal)
    }
    
    func textViewDidChange(_ textView: UITextView) {
        viewModel.description = textView.text
    }
    
    func getTags(tags: [String]) {
        viewModel.tags = tags
    }
    
    @objc func createFood() {
        showLoader()
        viewModel.createFood()
    }
}

