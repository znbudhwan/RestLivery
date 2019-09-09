//
//  SideMenuCell.swift
//  Restlivery
//
//  Created by Zain Budhwani on 9/9/19.
//  Copyright © 2019 Zain Budhwani. All rights reserved.
//

import UIKit

class SideMenuCell: UITableViewCell {
    
    let menuIcon: UIImageView = {
        let iV = UIImageView()
        iV.translatesAutoresizingMaskIntoConstraints = false
        return iV
    }()
    
    let menuLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = UIColor(red: 232/255, green: 63/255, blue: 111/255, alpha: 1.0)
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
        addSubview(menuIcon)
        addSubview(menuLabel)
        
        menuIcon.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        menuIcon.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        menuIcon.heightAnchor.constraint(equalToConstant: 25).isActive = true
        menuIcon.widthAnchor.constraint(equalToConstant: 25).isActive = true
        
        menuLabel.leftAnchor.constraint(equalTo: menuIcon.rightAnchor, constant: 12).isActive = true
        menuLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
}
