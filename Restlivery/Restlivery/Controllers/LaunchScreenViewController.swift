//
//  LaunchScreenViewController.swift
//  Restlivery
//
//  Created by Zain Budhwani on 9/8/19.
//  Copyright © 2019 Zain Budhwani. All rights reserved.
//

import UIKit
import Lottie

class LaunchScreenViewController: UIViewController {
    
    let lsLbl: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont(name: "AvenirNext-Bold", size: 64)
        lbl.textAlignment = .center
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = UIColor(red: 232/255, green: 63/255, blue: 111/255, alpha: 1.0)
        lbl.text = "Restlivery"
        return lbl
    }()
    
    let lsAnView: LOTAnimationView = {
        let anView = LOTAnimationView(name: "LoginAnimation")
        anView.play()
        anView.loopAnimation = true
        anView.contentMode = UIView.ContentMode.scaleAspectFill
        anView.clipsToBounds = true
        anView.translatesAutoresizingMaskIntoConstraints = false
        return anView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        Timer.scheduledTimer(timeInterval: 4, target: self, selector: #selector(showLoginGuide), userInfo: nil, repeats: false)
    }
    
    func setupViews() {
        let guide = view.safeAreaLayoutGuide
        view.addSubview(lsLbl)
        view.addSubview(lsAnView)
        
        lsLbl.leftAnchor.constraint(equalTo: guide.leftAnchor, constant: 16).isActive = true
        lsLbl.rightAnchor.constraint(equalTo: guide.rightAnchor, constant: -16).isActive = true
        lsLbl.topAnchor.constraint(equalTo: guide.topAnchor, constant: 160).isActive = true
        lsLbl.heightAnchor.constraint(equalToConstant: 84).isActive = true
        
        lsAnView.centerXAnchor.constraint(equalTo: guide.centerXAnchor).isActive = true
        lsAnView.centerYAnchor.constraint(equalTo: guide.centerYAnchor).isActive = true
        lsAnView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        lsAnView.widthAnchor.constraint(equalToConstant: 250).isActive = true
    }
    
    @objc func showLoginGuide() {
        present(LoginGuideViewController(), animated: true, completion: nil)
    }
}
