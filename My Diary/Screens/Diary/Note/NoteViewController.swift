//
//  NoteController.swift
//  My Diary
//
//  Created by Dima on 02.04.2023.
//

import UIKit


class NoteViewController: UIViewController {
    
    // MARK: - Properties
    var selectedIndex: Int?
    var mainVC: DiaryViewController?
    var noteView: NoteView { return self.view as! NoteView }

    // MARK: - Lifecycle
    override func loadView() {
        super.loadView()
        self.view = NoteView(frame: UIScreen.main.bounds)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAppearance()
    }
    
    
    // MARK: - Methods
    private func setupAppearance() {
        view.backgroundColor = Helper.Color.Main.dark
        setMainTitle("NOTE")
        createSaveButton()
        noteView.datePicker.addTarget(self, action: #selector(datePickerChanged), for: .valueChanged)
        navigationItem.backBarButtonItem?.tintColor = Helper.Color.Main.light
    }
    
    // Show selected date in dateTextField
    @objc private func datePickerChanged(_ sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        let dateString = dateFormatter.string(from: sender.date)
        noteView.dateTextField.text = dateString
    }
  
    // Create SaveButton + Appearance
    private func createSaveButton() {
        let saveButton = UIBarButtonItem(barButtonSystemItem: .save,
                                         target: self,
                                         action: #selector(saveButtonAction))
        // Set button colour
        saveButton.tintColor = Helper.Color.Main.light
        navigationItem.rightBarButtonItem = saveButton
        // Set the colour of the navigation bar
        navigationController?.navigationBar.tintColor = Helper.Color.Main.light
    }
    
    // Button to save the data
    @objc private func saveButtonAction() {
        navigationController?.popViewController(animated: true)
        
        let title = noteView.titleTextField.text ?? ""
        let date = noteView.dateTextField.text ?? ""
        let description = noteView.textView.text ?? ""
        
        // If there is a value in selectedIndex - update old cell or add new cell
        if let index = selectedIndex {
            ModelDiary.shared.updateNote(index: index, title: title, date: date, description: description)
            mainVC?.tableView.reloadRows(at: [IndexPath(row: index, section: 0)], with: .automatic)
        } else {
            ModelDiary.shared.saveNote(title: title, date: date, description: description)
        }
    }
}
