//
//  OrderInfoViewController.swift
//  Restlivery
//
//  Created by Zain Budhwani on 9/11/19.
//  Copyright © 2019 Zain Budhwani. All rights reserved.
//

import UIKit

class OrderInfoViewController: PullUpController, UITableViewDelegate, UITableViewDataSource {
    
    enum InitialState {
        case contracted
        case expanded
    }
    
    let orderId = "orderId"
    
    var initialState: InitialState = .contracted
    
    lazy var firstPreviewView: UIView = {
        let fpView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 100))
        fpView.translatesAutoresizingMaskIntoConstraints = false
        fpView.backgroundColor = .white
        
        let dvdView = UIView()
        dvdView.translatesAutoresizingMaskIntoConstraints = false
        dvdView.backgroundColor = .darkGray
        dvdView.layer.cornerRadius = 2.5
        
//        let driverImg = UIImageView()
//        driverImg.translatesAutoresizingMaskIntoConstraints = false
//        driverImg.image = #imageLiteral(resourceName: "placeholder")
//        driverImg.layer.cornerRadius = 25
//
//        let driverLbl = UILabel()
//        driverLbl.translatesAutoresizingMaskIntoConstraints = false
//        driverLbl.text = "Driver's name"
//        driverLbl.textColor = .darkGray
//        driverLbl.textAlignment = .left
//        driverLbl.font = UIFont.systemFont(ofSize: 18, weight: .bold)
//
//        let driverStaticLbl = UILabel()
//        driverStaticLbl.translatesAutoresizingMaskIntoConstraints = false
//        driverStaticLbl.text = "Your driver"
//        driverStaticLbl.textColor = .lightGray
//        driverStaticLbl.textAlignment = .left
//        driverStaticLbl.font = UIFont.systemFont(ofSize: 16, weight: .light)
//
//        let statusLbl = UILabel()
//        statusLbl.translatesAutoresizingMaskIntoConstraints = false
//        statusLbl
        
        fpView.addSubview(dvdView)
        
        dvdView.centerXAnchor.constraint(equalTo: fpView.centerXAnchor).isActive = true
        dvdView.heightAnchor.constraint(equalToConstant: 6).isActive = true
        dvdView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        dvdView.topAnchor.constraint(equalTo: fpView.topAnchor, constant: 8).isActive = true
        
        return fpView
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        tableView.register(TrayViewCell.self, forCellReuseIdentifier: orderId)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.attach(to: self)
        return tableView
    }()
    
    lazy var secondPreviewView: UIView = {
        let sPView = UIView(frame: CGRect(x: 0, y: firstPreviewView.frame.height, width: view.frame.width, height: 450))
        sPView.translatesAutoresizingMaskIntoConstraints = false
        sPView.backgroundColor = .white

        sPView.addSubview(tableView)
        tableView.leftAnchor.constraint(equalTo: sPView.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: sPView.rightAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: sPView.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: sPView.bottomAnchor).isActive = true

        return sPView
    }()
    
    var initialPointOffset: CGFloat {
        switch initialState {
        case .contracted:
            return firstPreviewView.frame.height
        case .expanded:
            return pullUpControllerPreferredSize.height
        }
    }
    
    public var portraitSize: CGSize = .zero
    
    public var landscapeFrame: CGRect = .zero
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        portraitSize = CGSize(width: min(UIScreen.main.bounds.width, UIScreen.main.bounds.height),
                              height: secondPreviewView.frame.maxY)
        landscapeFrame = CGRect(x: 5, y: 50, width: 280, height: 300)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.layer.cornerRadius = 12
    }
    
    func setupViews() {
        view.addSubview(firstPreviewView)
        view.addSubview(secondPreviewView)
        
        firstPreviewView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        firstPreviewView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        firstPreviewView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        firstPreviewView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        secondPreviewView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        secondPreviewView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        secondPreviewView.topAnchor.constraint(equalTo: firstPreviewView.bottomAnchor).isActive = true
        secondPreviewView.heightAnchor.constraint(equalToConstant: 450).isActive = true
    }
    
    override var pullUpControllerPreferredSize: CGSize {
        return portraitSize
    }
    
    override var pullUpControllerPreferredLandscapeFrame: CGRect {
        return landscapeFrame
    }
    
    override var pullUpControllerMiddleStickyPoints: [CGFloat] {
        switch initialState {
        case .contracted:
            return [firstPreviewView.frame.maxY]
        case .expanded:
            return [firstPreviewView.frame.maxY, secondPreviewView.frame.maxY]
        }
    }
    
    override var pullUpControllerBounceOffset: CGFloat {
        return 20
    }
    
    override func pullUpControllerAnimate(action: PullUpController.Action,
                                          withDuration duration: TimeInterval,
                                          animations: @escaping () -> Void,
                                          completion: ((Bool) -> Void)?) {
        switch action {
        case .move:
            UIView.animate(withDuration: 0.3,
                           delay: 0,
                           usingSpringWithDamping: 0.7,
                           initialSpringVelocity: 0,
                           options: .curveEaseInOut,
                           animations: animations,
                           completion: completion)
        default:
            UIView.animate(withDuration: 0.3,
                           animations: animations,
                           completion: completion)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: orderId, for: indexPath) as! TrayViewCell
        return cell
    }
}
