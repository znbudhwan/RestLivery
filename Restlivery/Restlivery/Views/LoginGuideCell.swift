//
//  LoginGuideCell.swift
//  Restlivery
//
//  Created by Zain Budhwani on 9/7/19.
//  Copyright © 2019 Zain Budhwani. All rights reserved.
//

import UIKit

class LoginGuideCell: UICollectionViewCell {
    
    let loginImageView: UIImageView = {
        let iV = UIImageView()
        iV.contentMode = .scaleAspectFill
        iV.clipsToBounds = true
        iV.translatesAutoresizingMaskIntoConstraints = false
        return iV
    }()
    
    let lineDivider: UIView = {
        let uV = UIView()
        uV.backgroundColor = UIColor(white: 0.9, alpha: 1)
        uV.translatesAutoresizingMaskIntoConstraints = false
        return uV
    }()
    
    let loginTextView: UITextView = {
        let tV = UITextView()
        tV.isEditable = false
        tV.text = "Sample Text"
        tV.contentInset = UIEdgeInsets(top: 32, left: 0, bottom: 0, right: 0)
        tV.translatesAutoresizingMaskIntoConstraints = false
        return tV
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        addSubview(loginImageView)
        addSubview(loginTextView)
        addSubview(lineDivider)
        
        loginImageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        loginImageView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        loginImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        loginImageView.bottomAnchor.constraint(equalTo: loginTextView.topAnchor).isActive = true
        
        loginTextView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        loginTextView.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
        loginTextView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        loginTextView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3).isActive = true
        
        lineDivider.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        lineDivider.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        lineDivider.bottomAnchor.constraint(equalTo: loginTextView.topAnchor).isActive = true
        lineDivider.heightAnchor.constraint(equalToConstant: 3.5).isActive = true
    }
}
