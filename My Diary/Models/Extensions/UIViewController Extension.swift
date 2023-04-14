//
//  UIViewController Extension.swift
//  My Diary
//
//  Created by Dima on 02.04.2023.
//

import UIKit

// Custome title
extension UIViewController {
    func setMainTitle(_ title: String) {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = title
        navigationController?.navigationBar.largeTitleTextAttributes = [
                NSAttributedString.Key.foregroundColor: Helper.Color.Main.bright,
            ]
    }
}
