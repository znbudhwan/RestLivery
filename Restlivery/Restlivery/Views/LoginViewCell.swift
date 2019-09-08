//
//  LoginViewController.swift
//  RestaurantDelivery
//
//  Created by Zain Budhwani on 9/5/19.
//  Copyright © 2019 Zain Budhwani. All rights reserved.
//

import UIKit
import Lottie

class LoginViewCell: UICollectionViewCell {
    
    let bgView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    let lgnLbl: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont(name: "AvenirNext-Bold", size: 64)
        lbl.textAlignment = .center
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = UIColor(red: 232/255, green: 63/255, blue: 111/255, alpha: 1.0)
        lbl.text = "Restlivery"
        return lbl
    }()
    
    let lgAnView: LOTAnimationView = {
        let uiView = LOTAnimationView()
        uiView.translatesAutoresizingMaskIntoConstraints = false
        uiView.setAnimation(named: "Order")
        uiView.animationSpeed = 2
        uiView.loopAnimation = true
        uiView.autoReverseAnimation = true
        uiView.play()
        uiView.contentMode = .scaleAspectFill
        return uiView
    }()
    
    let lgnBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        let titleAttribute = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18), NSAttributedString.Key.foregroundColor: UIColor.white]
        btn.setAttributedTitle(NSAttributedString(string: "Login with Facebook", attributes: titleAttribute), for: .normal)
        btn.backgroundColor = UIColor(red: 232/255, green: 63/255, blue: 111/255, alpha: 1.0)
        return btn
    }()
    
    let switchCtrl: UISegmentedControl = {
        let segCtrl = UISegmentedControl(items: ["Customer", "Driver"])
        segCtrl.translatesAutoresizingMaskIntoConstraints = false
        segCtrl.tintColor = UIColor(red: 78/255, green: 176/255, blue: 76/255, alpha: 1.0)
        return segCtrl
    }()
    
    let accBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        let titleAttribute = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15, weight: .semibold), NSAttributedString.Key.foregroundColor: UIColor(red: 232/255, green: 63/255, blue: 111/255, alpha: 1.0)]
        btn.setAttributedTitle(NSAttributedString(string: "USE A DIFFERENT ACCOUNT", attributes: titleAttribute), for: .normal)
        btn.backgroundColor = .clear
        return btn
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
        let guide = safeAreaLayoutGuide
        
        addSubview(bgView)
        addSubview(lgnLbl)
        addSubview(lgAnView)
        addSubview(lgnBtn)
        addSubview(switchCtrl)
        addSubview(accBtn)

        bgView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        bgView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        bgView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        bgView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        lgnLbl.centerXAnchor.constraint(equalTo: guide.centerXAnchor).isActive = true
        lgnLbl.topAnchor.constraint(equalTo: guide.topAnchor, constant: 96).isActive = true
        
        lgAnView.heightAnchor.constraint(equalToConstant: 308).isActive = true
        lgAnView.widthAnchor.constraint(equalToConstant: 308).isActive = true
        lgAnView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        lgAnView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        lgnBtn.leftAnchor.constraint(equalTo: guide.leftAnchor, constant: 32).isActive = true
        lgnBtn.rightAnchor.constraint(equalTo: guide.rightAnchor, constant: -32).isActive = true
        lgnBtn.heightAnchor.constraint(equalToConstant: 64).isActive = true
        lgnBtn.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -112).isActive = true
        
        switchCtrl.leftAnchor.constraint(equalTo: guide.leftAnchor, constant: 32).isActive = true
        switchCtrl.rightAnchor.constraint(equalTo: guide.rightAnchor, constant: -32).isActive = true
        switchCtrl.bottomAnchor.constraint(equalTo: lgnBtn.topAnchor, constant: -32).isActive = true
        switchCtrl.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        accBtn.leftAnchor.constraint(equalTo: guide.leftAnchor, constant: 32).isActive = true
        accBtn.rightAnchor.constraint(equalTo: guide.rightAnchor, constant: -32).isActive = true
        accBtn.heightAnchor.constraint(equalToConstant: 64).isActive = true
        accBtn.topAnchor.constraint(equalTo: lgnBtn.bottomAnchor, constant: 8).isActive = true
    }
}
