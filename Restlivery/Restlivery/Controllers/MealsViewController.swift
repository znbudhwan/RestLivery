//
//  MealsViewController.swift
//  Restlivery
//
//  Created by Zain Budhwani on 9/9/19.
//  Copyright © 2019 Zain Budhwani. All rights reserved.
//

import UIKit

class MealsViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout, GetMealsDelegate {
    
    let mealId = "mealId"
    let mealHeaderId = "mealHeaderId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rightBarBtnItem = UIBarButtonItem(image: #imageLiteral(resourceName: "icon_tray"), style: .plain, target: self, action: #selector(showTrayVC))
        rightBarBtnItem.tintColor = view.tintColor
        navigationItem.rightBarButtonItem = rightBarBtnItem
        rightBarBtnItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -26)

        collectionView.register(MealViewCell.self, forCellWithReuseIdentifier: mealId)
        collectionView.register(MealHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: mealHeaderId)
        setupViews()
    }
    
    func setupViews() {
        collectionView.backgroundColor = .white
    }
    
    func fetchMealsData() {
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: mealId, for: indexPath) as! MealViewCell
        cell.backgroundColor = .white
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 164)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: mealHeaderId, for: indexPath) as! MealHeaderView
        headerView.headerLbl.text = "Most popular"
        return headerView
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 54)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        show(OrderMealViewController(), sender: self)
    }
    
    @objc func showTrayVC() {
        show(TrayViewController(), sender: self)
    }
    
}
