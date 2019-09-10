//
//  SearchResultCell.swift
//  Restlivery
//
//  Created by Zain Budhwani on 9/8/19.
//  Copyright © 2019 Zain Budhwani. All rights reserved.
//

import UIKit

class SearchResultCell: UICollectionViewCell {
    
    let resImg: UIImageView = {
        let iV = UIImageView(image: #imageLiteral(resourceName: "blank_image"))
        iV.translatesAutoresizingMaskIntoConstraints = false
        iV.contentMode = .scaleAspectFill
        iV.clipsToBounds = true
        return iV
    }()
    
    let resNameLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "Restaurant's Name"
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        return lbl
    }()
    
    let resAddrLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "Restaurant's address will be placed here"
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.systemFont(ofSize: 15, weight: .light)
        lbl.textColor = .darkGray
        return lbl
    }()
    
    let dvdView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(white: 0.9, alpha: 1)
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
        addSubview(resImg)
        addSubview(resNameLbl)
        addSubview(resAddrLbl)
        addSubview(dvdView)
        
        resImg.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        resImg.leftAnchor.constraint(equalTo: leftAnchor, constant: 8).isActive = true
        resImg.rightAnchor.constraint(equalTo: rightAnchor, constant: -8).isActive = true
        resImg.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.68).isActive = true
        
        resNameLbl.topAnchor.constraint(equalTo: resImg.bottomAnchor, constant: 16).isActive = true
        resNameLbl.leftAnchor.constraint(equalTo: leftAnchor, constant: 8).isActive = true
        
        resAddrLbl.topAnchor.constraint(equalTo: resNameLbl.bottomAnchor, constant: 8).isActive = true
        resAddrLbl.leftAnchor.constraint(equalTo: leftAnchor, constant: 8).isActive = true
        
        dvdView.widthAnchor.constraint(equalToConstant: frame.width).isActive = true
        dvdView.heightAnchor.constraint(equalToConstant: 2).isActive = true
        dvdView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }

}
