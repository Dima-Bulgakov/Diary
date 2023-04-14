//
//  ThemeController.swift
//  My Diary
//
//  Created by Dima on 06.04.2023.
//

import UIKit

// MARK: - Enum for change of theme
enum Theme {
    case Theme1
    case Theme2
    case Theme3
    case Theme4
    case Theme5
    case Theme6
}

class ThemeController: UIViewController {
    
    // MARK: - Properties
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: ThemeController.createLayout())
        collection.backgroundColor = .clear
        collection.bounces = false
        return collection
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupApearance()
        setupConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
                
        collectionView.reloadData()
    }
    
    // MARK: - Methods
    private func setupApearance() {
        collectionView.register(ThemeCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addView(collectionView)
        setMainTitle("THEME")
        navigationController?.navigationBar.tintColor = Helper.Color.Main.light
        
    }
}

// MARK: - Extension

// Extension: UICollectionViewDelegate, UICollectionViewDataSource
extension ThemeController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? ThemeCollectionViewCell else {
            return UICollectionViewCell()
        }
        switch indexPath.item {
        case 0:
            cell.imageView.image = Helper.Image.Theme.theme1
        case 1:
            cell.imageView.image = Helper.Image.Theme.theme2
        case 2:
            cell.imageView.image = Helper.Image.Theme.theme3
        case 3:
            cell.imageView.image = Helper.Image.Theme.theme4
        case 4:
            cell.imageView.image = Helper.Image.Theme.theme5
        case 5:
            cell.imageView.image = Helper.Image.Theme.theme6
        default:
            break
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.item {
        case 0:
            changeTheme(theme: .Theme1)
        case 1:
            changeTheme(theme: .Theme2)
        case 2:
            changeTheme(theme: .Theme3)
        case 3:
            changeTheme(theme: .Theme4)
        case 4:
            changeTheme(theme: .Theme5)
        case 5:
            changeTheme(theme: .Theme6)
        default:
            break
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    // Animation tapped
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)!
        UIView.animate(withDuration: 0.05, delay: 0, options: [.curveEaseOut, .allowUserInteraction], animations: {
            cell.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
            cell.alpha = 0.5
        }, completion: nil)
    }

    // Tapped animation in cell of collectionView
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)!
        UIView.animate(withDuration: 0.05, delay: 0, options: [.curveEaseOut, .allowUserInteraction], animations: {
            cell.transform = CGAffineTransform.identity
            cell.alpha = 1
        }, completion: nil)
    }
    
    // Setup sizes for collectionView
    static func createLayout() -> UICollectionViewCompositionalLayout {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalWidth(0.5))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.5))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
    }
}

// MARK: - Extension: Methods for change of color in theme
extension ThemeController {
    
    func changeColor(dark: UIColor, middle: UIColor, bright: UIColor, light: UIColor) {
        Helper.Color.Main.dark = dark
        Helper.Color.Main.middle = middle
        Helper.Color.Main.bright = bright
        Helper.Color.Main.light = light
    }
    
    func changeTheme(theme: Theme) {
        switch theme {
        case .Theme1:
            changeColor(dark: Helper.Color.Theme1.dark,
                        middle: Helper.Color.Theme1.middle,
                        bright: Helper.Color.Theme1.bright,
                        light: Helper.Color.Theme1.light)
        case .Theme2:
            changeColor(dark: Helper.Color.Theme2.dark,
                        middle: Helper.Color.Theme2.middle,
                        bright: Helper.Color.Theme2.bright,
                        light: Helper.Color.Theme2.light)
        case .Theme3:
            changeColor(dark: Helper.Color.Theme3.dark,
                        middle: Helper.Color.Theme3.middle,
                        bright: Helper.Color.Theme3.bright,
                        light: Helper.Color.Theme3.light)
        case .Theme4:
            changeColor(dark: Helper.Color.Theme4.dark,
                        middle: Helper.Color.Theme4.middle,
                        bright: Helper.Color.Theme4.bright,
                        light: Helper.Color.Theme4.light)
        case .Theme5:
            changeColor(dark: Helper.Color.Theme5.dark,
                        middle: Helper.Color.Theme5.middle,
                        bright: Helper.Color.Theme5.bright,
                        light: Helper.Color.Theme5.light)
        case .Theme6:
            changeColor(dark: Helper.Color.Theme6.dark,
                        middle: Helper.Color.Theme6.middle,
                        bright: Helper.Color.Theme6.bright,
                        light: Helper.Color.Theme6.light)
        }
    }
}

// MARK: - Extension: Setup constraints
private extension ThemeController {
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 22),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }
}
