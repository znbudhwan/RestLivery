//
//  LoginViewController.swift
//  RestaurantDelivery
//
//  Created by Zain Budhwani on 9/5/19.
//  Copyright © 2019 Zain Budhwani. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    let bgView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 36/255, green: 33/255, blue: 62/255, alpha: 1.0)
        return view
    }()
    
    let appLbl: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont(name: "AvenirNext-Bold", size: 64)
        lbl.textAlignment = .center
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = UIColor(red: 232/255, green: 63/255, blue: 111/255, alpha: 1.0)
        lbl.text = "Restlivery"
        return lbl
    }()
    
    let appImgView: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.image = #imageLiteral(resourceName: "blank_image")
        imgView.contentMode = .scaleAspectFill
        imgView.clipsToBounds = true
        return imgView
    }()
    
    let lgnBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        let titleAttribute = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18), NSAttributedString.Key.foregroundColor: UIColor.white]
        btn.setAttributedTitle(NSAttributedString(string: "Login with Facebook", attributes: titleAttribute), for: .normal)
        btn.backgroundColor = UIColor(red: 78/255, green: 176/255, blue: 76/255, alpha: 1.0)
        btn.addTarget(self, action: #selector(presentSearchVC), for: .touchUpInside)
        return btn
    }()
    
    let switchCtrl: UISegmentedControl = {
        let segCtrl = UISegmentedControl(items: ["Customer", "Driver"])
        segCtrl.translatesAutoresizingMaskIntoConstraints = false
        segCtrl.tintColor = UIColor(red: 232/255, green: 63/255, blue: 111/255, alpha: 1.0)
        return segCtrl
    }()
    
    let accBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        let titleAttribute = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15, weight: .semibold), NSAttributedString.Key.foregroundColor: UIColor.white]
        btn.setAttributedTitle(NSAttributedString(string: "USE A DIFFERENT ACCOUNT", attributes: titleAttribute), for: .normal)
        btn.backgroundColor = .clear
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
    }
    
    func setupViews() {
        let guide = view.safeAreaLayoutGuide
        
        view.addSubview(bgView)
        view.addSubview(appLbl)
        view.addSubview(appImgView)
        view.addSubview(lgnBtn)
        view.addSubview(switchCtrl)
        view.addSubview(accBtn)

        bgView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        bgView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        bgView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        bgView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        appLbl.centerXAnchor.constraint(equalTo: guide.centerXAnchor).isActive = true
        appLbl.topAnchor.constraint(equalTo: guide.topAnchor, constant: 96).isActive = true
        
        appImgView.heightAnchor.constraint(equalToConstant: 225).isActive = true
        appImgView.leftAnchor.constraint(equalTo: guide.leftAnchor, constant: 32).isActive = true
        appImgView.rightAnchor.constraint(equalTo: guide.rightAnchor, constant: -32).isActive = true
        appImgView.topAnchor.constraint(equalTo: appLbl.bottomAnchor, constant: 48).isActive = true
        
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
    
    @objc func presentSearchVC() {
        let sWRevealController = SWRevealViewController(rearViewController: SideMenuViewController(), frontViewController: UINavigationController(rootViewController: SearchViewController()))!
        showDetailViewController(sWRevealController, sender: self)
    }
}
