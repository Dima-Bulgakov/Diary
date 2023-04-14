//
//  UIView Extension.swift
//  My Diary
//
//  Created by Dima on 04.04.2023.
//

import UIKit

// Custom addSubview
extension UIView {
    func addView(_ view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
    }
}

