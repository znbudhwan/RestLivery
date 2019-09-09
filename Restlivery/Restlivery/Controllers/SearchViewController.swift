//
//  SearchViewController.swift
//  Restlivery
//
//  Created by Zain Budhwani on 9/6/19.
//  Copyright © 2019 Zain Budhwani. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let searchId = "SearchId"
    
    let searchBar: UISearchBar = {
        let sBar = UISearchBar()
        sBar.translatesAutoresizingMaskIntoConstraints = false
        sBar.placeholder = "Search for Restaurants"
        sBar.barTintColor = .white
        return sBar
    }()
    
    lazy var searchResView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cV = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cV.translatesAutoresizingMaskIntoConstraints = false
        cV.backgroundColor = .white
        cV.delegate = self
        cV.dataSource = self
        cV.register(SearchResultCell.self, forCellWithReuseIdentifier: searchId)
        return cV
    }()
    
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
        
        view.addSubview(searchBar)
        view.addSubview(searchResView)
        
        searchBar.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        searchBar.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        searchBar.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
        
        searchResView.topAnchor.constraint(equalTo: searchBar.topAnchor).isActive = true
        searchResView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        searchResView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        searchResView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = searchResView.dequeueReusableCell(withReuseIdentifier: searchId, for: indexPath) as! SearchResultCell
        cell.backgroundColor = .white
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 250)
    }
}
