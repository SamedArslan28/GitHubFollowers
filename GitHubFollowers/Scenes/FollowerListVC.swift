//
//  FollowerListVCViewController.swift
//  GitHubFollowers
//
//  Created by Abdulsamed Arslan on 2.01.2024.
//

import UIKit

class FollowerListVC: UIViewController {
    
    var name: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        NetworkManager.shared.getFollowers(for: name, page: 1) { result in
            
            switch result {
            case .success(let followers):
                print(followers)
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Errors", message: error.rawValue, buttonTitle: "OK")
            }
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
}
