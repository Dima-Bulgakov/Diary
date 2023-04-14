//
//  SettingsController.swift
//  My Diary
//
//  Created by Dima on 02.04.2023.
//

import UIKit


class SettingsViewController: UITableViewController {

    // MARK: - Properties
    static let shared = SettingsViewController()
    
    var dailyReminder = true {
        didSet {
            print("dailyReminder: \(dailyReminder)")
        }
    }
    var secureLogin = false {
        didSet {
            print("secureLogin: \(secureLogin)")
        }
    }
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadSettings()
        setupAppearance()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    
    // MARK: - Methods
    private func setupAppearance() {
        tableView.register(SettingTableViewCell.self, forCellReuseIdentifier: SettingTableViewCell.identifier)
        view.backgroundColor = Helper.Color.Main.dark
        tableView.separatorStyle = .none
        tableView.bounces = false
        setMainTitle("SETTINGS")
    }
    
    // Setting tableView
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingTableViewCell.identifier, for: indexPath) as? SettingTableViewCell else {
            return UITableViewCell()
        }
        
        // Cell apearance
        cell.textLabel?.textColor = Helper.Color.Main.light
        cell.selectionStyle = .none
        
        // Cell Settings
        switch indexPath.section {
        case 0:
            cell.labelCell.text = "Daily reminder"
            cell.switchCell.isHidden = false
            cell.switchCell.isOn = dailyReminder
            cell.switchCell.addTarget(self, action: #selector(dailyReminderSwitchValueChanged), for: .valueChanged)
        case 1:
            cell.labelCell.text = "Secure login"
            cell.switchCell.isHidden = false
            cell.switchCell.isOn = secureLogin
            cell.switchCell.addTarget(self, action: #selector(secureLoginSwitchValueChanged), for: .valueChanged)
            
        case 2:
            cell.labelCell.text = "Theme"
            cell.switchCell.isHidden = true
            cell.themeButton.isHidden = false
            cell.themeButton.addTarget(self, action: #selector(themeButtonTapped), for: .touchUpInside)
        default:
            break
        }
        return cell
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = Helper.Color.Main.middle
        return headerView
    }
    
    // Button action go to ThemeVC
    @objc private func themeButtonTapped() {
        let vc = ThemeController()
        navigationController?.pushViewController(vc, animated: true)
        print("To ThemeVC")
    }
    
    // Save switch value to "dailyReminder" property
    @objc private func dailyReminderSwitchValueChanged(sender: UISwitch) {
        dailyReminder = sender.isOn
        saveSettings()
    }
    
    // Save switch value to "secureLogin" property
    @objc private func secureLoginSwitchValueChanged(sender: UISwitch) {
        secureLogin = sender.isOn
        saveSettings()
    }
    
    //Methods to save ane load a Bool properties
    private func saveSettings() {
        let defaults = UserDefaults.standard
        defaults.set(dailyReminder, forKey: "dailyReminder")
        defaults.set(secureLogin, forKey: "secureLogin")

    }
    
    private func loadSettings() {
        let defaults = UserDefaults.standard
        dailyReminder = defaults.bool(forKey: "dailyReminder")
        secureLogin = defaults.bool(forKey: "secureLogin")
    }
}

