//
//  SearchViewController.swift
//  Restlivery
//
//  Created by Zain Budhwani on 9/6/19.
//  Copyright © 2019 Zain Budhwani. All rights reserved.
//

import UIKit

protocol GetMealsDelegate: class {
    func fetchMealsData()
}

class SearchViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let searchId = "SearchId"
    
    let searchBar: UISearchBar = {
        let sBar = UISearchBar()
        sBar.translatesAutoresizingMaskIntoConstraints = false
        sBar.placeholder = "Search for Restaurants"
        sBar.barTintColor = .white
        return sBar
    }()
    
    let placeholderView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        
        let placeholderImgView = UIImageView(image:  #imageLiteral(resourceName: "icon_restaurants"))
        placeholderImgView.translatesAutoresizingMaskIntoConstraints = false
        placeholderImgView.contentMode = .scaleAspectFill
        placeholderImgView.clipsToBounds = true
        
        let placeholderLbl = UILabel()
        placeholderLbl.translatesAutoresizingMaskIntoConstraints = false
        placeholderLbl.text = "Search for your favorite restaurants!"
        placeholderLbl.isUserInteractionEnabled = true
        placeholderLbl.font = UIFont.systemFont(ofSize: 16, weight: .light)
        placeholderLbl.textColor = .darkGray
        
        view.addSubview(placeholderImgView)
        view.addSubview(placeholderLbl)
        
        placeholderImgView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        placeholderImgView.bottomAnchor.constraint(equalTo: placeholderLbl.topAnchor, constant: -16).isActive = true
        placeholderImgView.widthAnchor.constraint(equalToConstant: 225).isActive = true
        placeholderImgView.heightAnchor.constraint(equalToConstant: 225).isActive = true
        
        placeholderLbl.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        placeholderLbl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        return view
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
    
    var arr: [Int] = [0] { // CHANGE TO RESTAURANT OBJECT
        didSet {
            self.searchResView.reloadData()
            updateList()
        }
    }
    
    weak var delegate: GetMealsDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let lftBarBtnItem = UIBarButtonItem(image: #imageLiteral(resourceName: "icon_menu_24dp"), style: .plain, target: self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)))
        let rightBarBtnItem = UIBarButtonItem(image: #imageLiteral(resourceName: "icon_tray"), style: .plain, target: self, action: #selector(showTrayVC))
        lftBarBtnItem.tintColor = view.tintColor
        rightBarBtnItem.tintColor = view.tintColor
        rightBarBtnItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -26)
        navigationItem.leftBarButtonItem = lftBarBtnItem
        navigationItem.rightBarButtonItem = rightBarBtnItem
        setupViews()
    }
    
    func setupViews() {
        view.addGestureRecognizer((revealViewController()?.panGestureRecognizer())!)
        let guide = view.safeAreaLayoutGuide
        
        view.addSubview(searchBar)
        view.addSubview(searchResView)
        view.addSubview(placeholderView)

        searchBar.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        searchBar.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        searchBar.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
        
        placeholderView.topAnchor.constraint(equalTo: searchBar.bottomAnchor).isActive = true
        placeholderView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        placeholderView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        placeholderView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        searchResView.topAnchor.constraint(equalTo: searchBar.bottomAnchor).isActive = true
        searchResView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        searchResView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        searchResView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        updateList()
        return arr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = searchResView.dequeueReusableCell(withReuseIdentifier: searchId, for: indexPath) as! SearchResultCell
        cell.backgroundColor = .white
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 250)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let layout = UICollectionViewFlowLayout()
        let mealsListVC = MealsViewController(collectionViewLayout: layout)
        delegate = mealsListVC
        delegate?.fetchMealsData()
        show(mealsListVC, sender: self)
    }
    
    func updateList() {
        if arr.count == 0 {
            searchResView.isHidden = true
            placeholderView.isHidden = false
        } else {
            searchResView.isHidden = false
            placeholderView.isHidden = true
        }
    }
    
    @objc func showTrayVC() {
        show(TrayViewController(), sender: self)
    }
}
