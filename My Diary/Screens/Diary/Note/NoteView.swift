//
//  NoteView.swift
//  My Diary
//
//  Created by Dima on 02.04.2023.
//

import UIKit

class NoteView: UIView {
    
    // MARK: - Properties
    let datePicker = UIDatePicker()
    
    let titleTextField: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth = 1
        textField.layer.borderColor = Helper.Color.Main.middle.cgColor
        textField.textColor = Helper.Color.Main.light
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: textField.frame.height))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        
        let placeholderAttributes = [NSAttributedString.Key.foregroundColor: Helper.Color.Main.middle]
        let attributedPlaceholder = NSAttributedString(string: "Day title", attributes: placeholderAttributes)
        textField.attributedPlaceholder = attributedPlaceholder
        return textField
    }()
    
    let dateTextField: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth = 1
        textField.layer.borderColor = Helper.Color.Main.middle.cgColor
        textField.textColor = Helper.Color.Main.light
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: textField.frame.height))
        textField.leftView = paddingView
        textField.leftViewMode = .always
                
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let dateString = dateFormatter.string(from: currentDate)
        textField.text = dateString
        return textField
    }()
    
    let textView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = Helper.Color.Main.middle.withAlphaComponent(0.5)
        textView.textColor = Helper.Color.Main.light
        textView.layer.cornerRadius = 10
        textView.font = .systemFont(ofSize: 17.5)
        
        textView.textContainerInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        return textView
    }()
    
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupAppearance()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Methods
    private func setupAppearance() {
        
        addTap()
        configDatePicker()
        
        titleTextField.delegate = self
        dateTextField.delegate = self
        
        addView(titleTextField)
        addView(dateTextField)
        addView(textView)
    }
    
    private func configDatePicker() {
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        dateTextField.inputView = datePicker
    }
    
    // Create Hide Keyboard
    private func addTap() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        tap.cancelsTouchesInView = false
        addGestureRecognizer(tap)
    }
    
    @objc private func hideKeyboard() {
        endEditing(true)
    }
}


// MARK: - Extension: TextField Delegate
extension NoteView: UITextFieldDelegate {
    
    // Hiding the keybork after pressing the "return" button
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}


// MARK: - Extension: Constraints
extension NoteView {
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            titleTextField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 22),
            titleTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            titleTextField.heightAnchor.constraint(equalToConstant: 60),
            
            dateTextField.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 22),
            dateTextField.widthAnchor.constraint(equalTo: titleTextField.widthAnchor),
            dateTextField.heightAnchor.constraint(equalTo: titleTextField.heightAnchor),
            dateTextField.centerXAnchor.constraint(equalTo: titleTextField.centerXAnchor),

            textView.topAnchor.constraint(equalTo: dateTextField.bottomAnchor, constant: 22),
            textView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            textView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            textView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -22)
        ])
    }
}
