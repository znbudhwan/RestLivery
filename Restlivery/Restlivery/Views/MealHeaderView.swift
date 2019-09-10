//
//  MealHeaderCell.swift
//  Restlivery
//
//  Created by Zain Budhwani on 9/9/19.
//  Copyright © 2019 Zain Budhwani. All rights reserved.
//

import UIKit

class MealHeaderView: UICollectionReusableView {
    
    let headerLbl: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        lbl.textAlignment = .center
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        addSubview(headerLbl)
        headerLbl.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        headerLbl.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        headerLbl.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        headerLbl.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
}
