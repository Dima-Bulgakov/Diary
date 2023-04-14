//
//  MainTableViewCell.swift
//  My Diary
//
//  Created by Dima on 02.04.2023.
//

import UIKit

class DiaryTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    static let identifier = "cell"
    
    lazy var mainTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        return label
    }()
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = Helper.Color.Main.bright
        label.textAlignment = .right
        return label
    }()
    
    lazy var offsetView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 1
        view.layer.borderColor = Helper.Color.Main.middle.cgColor
        view.clipsToBounds = true
        return view
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
        contentView.addView(mainTitleLabel)
        contentView.addView(dateLabel)
        contentView.addView(offsetView)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.accessoryType = .none
    }
}


// MARK: - Extension: Constraints
extension DiaryTableViewCell {
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            offsetView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            offsetView.leadingAnchor.constraint(equalTo: leadingAnchor),
            offsetView.trailingAnchor.constraint(equalTo: trailingAnchor),
            offsetView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -11),

            dateLabel.centerYAnchor.constraint(equalTo: offsetView.centerYAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: offsetView.trailingAnchor, constant: -16),
            dateLabel.widthAnchor.constraint(equalToConstant: 100),
            
            mainTitleLabel.centerYAnchor.constraint(equalTo: offsetView.centerYAnchor),
            mainTitleLabel.leadingAnchor.constraint(equalTo: offsetView.leadingAnchor, constant: 16),
            mainTitleLabel.trailingAnchor.constraint(equalTo: dateLabel.leadingAnchor, constant: -2),
        ])
    }
}

