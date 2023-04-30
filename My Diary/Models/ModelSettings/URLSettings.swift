//
//  URLSettings.swift
//  My Diary
//
//  Created by Dima on 30.04.2023.
//

import Foundation
import UIKit

// MARK: - Add Privacy Policy
class URLSettings {
    
    static let shared = URLSettings()
    
    func freeprivacypolicy() {
        if let url = URL(string: "https://www.freeprivacypolicy.com/live/0e14abf1-aa9d-4385-90a2-b9ac237bb925") {
            UIApplication.shared.open(url)
        }
    }
}
