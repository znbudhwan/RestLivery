//
//  TrayViewCell.swift
//  Restlivery
//
//  Created by Zain Budhwani on 9/11/19.
//  Copyright © 2019 Zain Budhwani. All rights reserved.
//

import UIKit

class TrayViewCell: UITableViewCell {
    
    let quantityLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = UIColor(red: 78/255, green: 176/255, blue: 76/255, alpha: 1)
        lbl.text = "123×"
        lbl.textAlignment = .left
        lbl.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        return lbl
    }()
    
    let mealLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "The name of the meal would be placed here"
        lbl.textAlignment = .left
        lbl.font = UIFont.systemFont(ofSize: 16)
        return lbl
    }()
    
    let priceLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "$100.00"
        lbl.textAlignment = .right
        lbl.font = UIFont.systemFont(ofSize: 16)
        return lbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .white
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        addSubview(quantityLbl)
        addSubview(mealLbl)
        addSubview(priceLbl)
        
        quantityLbl.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        quantityLbl.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        quantityLbl.widthAnchor.constraint(equalToConstant: quantityLbl.intrinsicContentSize.width).isActive = true
        
        mealLbl.leftAnchor.constraint(equalTo: quantityLbl.rightAnchor, constant: 16).isActive = true
        mealLbl.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        priceLbl.leftAnchor.constraint(equalTo: mealLbl.rightAnchor, constant: 16).isActive = true
        priceLbl.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
        priceLbl.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        priceLbl.widthAnchor.constraint(equalToConstant: priceLbl.intrinsicContentSize.width).isActive = true
    }
}
