//
//  SettingTableViewCell.swift
//  My Diary
//
//  Created by Dima on 04.04.2023.
//

import UIKit

class SettingTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    static let identifier = "cell"
    
    let labelCell: UILabel = {
        let label = UILabel()
        label.layer.cornerRadius = 10
        label.layer.borderWidth = 1
        label.layer.borderColor = Helper.Color.Main.middle.cgColor
        label.textColor = Helper.Color.Main.light
        label.textAlignment = .left
        label.backgroundColor = .clear
        label.clipsToBounds = true
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.firstLineHeadIndent = 16
        let attributedString = NSMutableAttributedString(string: " ", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        label.attributedText = attributedString

        return label
    }()

    let switchCell: UISwitch = {
        let switchCell = UISwitch()
        switchCell.onTintColor = Helper.Color.Main.bright
        switchCell.isHidden = true
        return switchCell
    }()
    
    let themeButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = Helper.Color.Main.bright
        button.contentMode = .scaleAspectFit
        button.isHidden = true
        button.layer.cornerRadius = 20
        button.layer.masksToBounds = true
        button.tintColor = Helper.Color.Main.bright
        return button
    }()
    
    let iconButton: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(named: "theme1")
        button.setImage(image, for: .normal)
        button.contentMode = .scaleAspectFit
        button.isHidden = true
        button.layer.cornerRadius = 20
        button.layer.masksToBounds = true
        button.tintColor = Helper.Color.Main.light
        return button
    }()
    
    
    // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupAppearance()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Methods
    func setupAppearance() {
        backgroundColor = .clear
        addView(labelCell)
        contentView.addView(switchCell)
        contentView.addView(themeButton)
        contentView.addView(iconButton)
    }
}


// MARK: - Extension
extension SettingTableViewCell {
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            labelCell.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            labelCell.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            labelCell.topAnchor.constraint(equalTo: topAnchor),
            labelCell.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            switchCell.centerYAnchor.constraint(equalTo: centerYAnchor),
            switchCell.trailingAnchor.constraint(equalTo: labelCell.trailingAnchor, constant: -16),
            
            themeButton.widthAnchor.constraint(equalToConstant: 40),
            themeButton.heightAnchor.constraint(equalTo: themeButton.widthAnchor),
            themeButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            themeButton.centerXAnchor.constraint(equalTo: switchCell.centerXAnchor),
            
            iconButton.widthAnchor.constraint(equalTo: themeButton.widthAnchor),
            iconButton.heightAnchor.constraint(equalTo: iconButton.widthAnchor),
            iconButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconButton.centerXAnchor.constraint(equalTo: switchCell.centerXAnchor)
        ])
    }
}
