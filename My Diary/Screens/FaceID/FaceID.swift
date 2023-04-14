//
//  FaceID.swift
//  My Diary
//
//  Created by Dima on 13.04.2023.
//

import UIKit
import LocalAuthentication

class FaceIDViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        let contex = LAContext()
        var error: NSError? = nil
        if contex.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            
            let reason = "Please authorize with tooch id"
            contex.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics,
                                  localizedReason: reason) { [weak self] success, error in
                DispatchQueue.main.async {
                    guard success, error == nil else {
                        // failed
                        let alert = UIAlertController(title: "Failed to Authenticate",
                                                      message: "Please try again.",
                                                      preferredStyle: .alert)
                        let action = UIAlertAction(title: "Dismiss",
                                                   style: .cancel)
                        alert.addAction(action)
                        self?.present(alert, animated: true)
                        return
                    }
                    // Show other screen
                    // Success
                    let vc = UIViewController()
                    vc.title = "Welcome!"
                    vc.view.backgroundColor = .systemBlue
                    let tabBarVC = TabBarController()
                    tabBarVC.navigationItem.hidesBackButton = true
                    self?.navigationController?.pushViewController(tabBarVC, animated: true)
                }
            }
        } else {
            // Can not use
            let alert = UIAlertController(title: "Unavailable",
                                          message: "You cant use this feature",
                                          preferredStyle: .alert)
            let action = UIAlertAction(title: "Dismiss",
                                       style: .cancel)
            alert.addAction(action)
            present(alert, animated: true)
        }
    }
}
