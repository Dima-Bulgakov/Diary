//
//  MainViewController.swift
//  My Diary
//
//  Created by Dima on 02.04.2023.
//

import UIKit


class DiaryViewController: UIViewController {
    
    // MARK: - Properties
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.bounces = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(DiaryTableViewCell.self, forCellReuseIdentifier: DiaryTableViewCell.identifier)
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    lazy var createFirstNoteButton: UIButton = {
        let button = UIButton()
        button.setTitle("Create first note", for: .normal)
        button.setTitleColor(Helper.Color.Main.middle, for: .normal)
        button.titleLabel?.textAlignment = .center
        button.addTarget(self, action: #selector(createFirstNoteButtonAction), for: .touchUpInside)
        return button
    }()
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAppearance()
        setupConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tableView.reloadData()
        hideCreateFirstNoteButton()
    }
    
    
    // MARK: - Methods
    private func setupAppearance() {
        setMainTitle("DIARY")
        buttonsAction()
        view.addView(tableView)
        view.addView(createFirstNoteButton)
    }
    
    // Create add right bar button item
    func buttonsAction() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                            target: self,
                                                            action: #selector(addButtonAction))
        navigationItem.rightBarButtonItem?.tintColor = Helper.Color.Main.light
    }
    
    @objc private func addButtonAction() {
        let vc = NoteViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    // CreateFirstNoteButton Action
    @objc func createFirstNoteButtonAction() {
        let noteVC = NoteViewController()
        navigationController?.pushViewController(noteVC, animated: true)
    }
    
    // Method to hide CreateFirstNoteButton
    func hideCreateFirstNoteButton() {
        if ModelDiary.shared.noteArray.count == 0 {
            self.view.addSubview(createFirstNoteButton)
        } else {
            createFirstNoteButton.isHidden = true
        }
    }
}


// MARK: - Extensions: UITableViewDelegate, UITableViewDataSource
extension DiaryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DiaryTableViewCell.identifier, for: indexPath) as? DiaryTableViewCell else { return UITableViewCell() }
        
        // Cell apearance and settings
        cell.backgroundColor = .clear
        cell.mainTitleLabel.textColor = Helper.Color.Main.light
        cell.selectionStyle = .none
        
        
        // Load data from ModelDiary
        cell.mainTitleLabel.text = ModelDiary.shared.noteArray[indexPath.row].title
        cell.dateLabel.text = ModelDiary.shared.noteArray[indexPath.row].date
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ModelDiary.shared.noteArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 71
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let noteVC = NoteViewController()
        
        // Save the indexPath in the "selectedIndex" to know create a new cell or update old
        noteVC.selectedIndex = indexPath.row
        
        // Load data from ModelDiary to Note
        noteVC.noteView.titleTextField.text = ModelDiary.shared.noteArray[indexPath.row].title
        noteVC.noteView.dateTextField.text = ModelDiary.shared.noteArray[indexPath.row].date
        noteVC.noteView.textView.text = ModelDiary.shared.noteArray[indexPath.row].description
        
        navigationController?.pushViewController(noteVC, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // Delete cell and data when you swipe
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            ModelDiary.shared.deleteNote(index: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}


// MARK: - Extensions: Constraints
extension DiaryViewController {
    func setupConstraints() {
        NSLayoutConstraint.activate([
            createFirstNoteButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            createFirstNoteButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}
