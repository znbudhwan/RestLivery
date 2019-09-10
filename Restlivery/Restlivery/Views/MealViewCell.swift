//
//  MealViewCell.swift
//  Restlivery
//
//  Created by Zain Budhwani on 9/9/19.
//  Copyright © 2019 Zain Budhwani. All rights reserved.
//

import UIKit

class MealViewCell: UICollectionViewCell {
    
    let mealNameLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "Name of the meal here"
        lbl.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textAlignment = .left
        return lbl
    }()
    
    let shortDescLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "This is a short description of the meal. Will usually be pretty long and would even require multiple lines"
        lbl.font = UIFont.systemFont(ofSize: 17)
        lbl.textColor = .darkGray
        lbl.textAlignment = .left
        lbl.numberOfLines = 4
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let mealImg: UIImageView = {
        let iV = UIImageView(image: #imageLiteral(resourceName: "splash_screen"))
        iV.translatesAutoresizingMaskIntoConstraints = false
        iV.contentMode = .scaleAspectFill
        iV.clipsToBounds = true
        return iV
    }()
    
    let priceLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "$99.99"
        lbl.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        lbl.textColor = .darkGray
        lbl.textAlignment = .left
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let dvdView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.9, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        addSubview(mealImg)
        addSubview(mealNameLbl)
        addSubview(shortDescLbl)
        addSubview(priceLbl)
        addSubview(dvdView)
        
        mealImg.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        mealImg.rightAnchor.constraint(equalTo: rightAnchor, constant: -8).isActive = true
        mealImg.heightAnchor.constraint(equalToConstant: 100).isActive = true
        mealImg.widthAnchor.constraint(equalToConstant: 124).isActive = true
        
        mealNameLbl.leftAnchor.constraint(equalTo: leftAnchor, constant: 8).isActive = true
        mealNameLbl.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        mealNameLbl.rightAnchor.constraint(equalTo: mealImg.leftAnchor, constant: -16).isActive = true
        
        shortDescLbl.leftAnchor.constraint(equalTo: leftAnchor, constant: 8).isActive = true
        shortDescLbl.topAnchor.constraint(equalTo: mealNameLbl.bottomAnchor, constant: 16).isActive = true
        shortDescLbl.rightAnchor.constraint(equalTo: mealImg.leftAnchor, constant: -16).isActive = true
        shortDescLbl.heightAnchor.constraint(equalToConstant: 84).isActive = true
        
        priceLbl.leftAnchor.constraint(equalTo: leftAnchor, constant: 8).isActive = true
        priceLbl.topAnchor.constraint(equalTo: shortDescLbl.bottomAnchor, constant: 16).isActive = true
        priceLbl.rightAnchor.constraint(equalTo: mealImg.leftAnchor, constant: -16).isActive = true
        
        dvdView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        dvdView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        dvdView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -2.5).isActive = true
        dvdView.heightAnchor.constraint(equalToConstant: 2.5).isActive = true
    }
}
