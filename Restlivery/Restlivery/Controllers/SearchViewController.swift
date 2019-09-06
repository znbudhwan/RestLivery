//
//  SearchViewController.swift
//  Restlivery
//
//  Created by Zain Budhwani on 9/6/19.
//  Copyright © 2019 Zain Budhwani. All rights reserved.
//

import Foundation
import UIKit

class SearchViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let lftBarBtnItem = UIBarButtonItem(image: #imageLiteral(resourceName: "icon_menu_24dp"), style: .plain, target: self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)))
        lftBarBtnItem.tintColor = view.tintColor
        navigationItem.leftBarButtonItem = lftBarBtnItem
        setupViews()
    }
    
    
    func setupViews() {
        view.addGestureRecognizer((revealViewController()?.panGestureRecognizer())!)
        let guide = view.safeAreaLayoutGuide
        
        let searchBar: UISearchBar = {
            let sBar = UISearchBar()
            sBar.translatesAutoresizingMaskIntoConstraints = false
            sBar.placeholder = "Search for Restaurants"
            sBar.barTintColor = .white
            return sBar
        }()
        
        view.addSubview(searchBar)
        searchBar.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        searchBar.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        searchBar.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
    }
    
    
}
