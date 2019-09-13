//
//  TrayViewController.swift
//  Restlivery
//
//  Created by Zain Budhwani on 9/10/19.
//  Copyright © 2019 Zain Budhwani. All rights reserved.
//

import UIKit
import MapKit

class TrayViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let trayId = "trayId"
    
    let placeholderView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        
        let placeholderImgView = UIImageView(image:  #imageLiteral(resourceName: "icon_delivery"))
        placeholderImgView.translatesAutoresizingMaskIntoConstraints = false
        placeholderImgView.contentMode = .scaleAspectFill
        placeholderImgView.clipsToBounds = true
        
        let placeholderLbl = UILabel()
        placeholderLbl.translatesAutoresizingMaskIntoConstraints = false
        placeholderLbl.text = "Your tray is empty! Add orders from your favorite restaurants!"
        placeholderLbl.numberOfLines = 2
        placeholderLbl.font = UIFont.systemFont(ofSize: 16, weight: .light)
        placeholderLbl.textColor = .darkGray
        
        view.addSubview(placeholderImgView)
        view.addSubview(placeholderLbl)
        
        placeholderImgView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        placeholderImgView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        placeholderImgView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        placeholderImgView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        placeholderLbl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        placeholderLbl.topAnchor.constraint(equalTo: placeholderImgView.bottomAnchor, constant: 16).isActive = true
        placeholderLbl.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 32).isActive = true
        placeholderLbl.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -32).isActive = true
        
        return view
    }()
    
    lazy var orderTblView: UITableView = {
        let tblView = UITableView(frame: .zero, style: .plain)
        tblView.backgroundColor = .white
        tblView.tableFooterView = UIView()
        tblView.translatesAutoresizingMaskIntoConstraints = false
        tblView.rowHeight = 85
        tblView.dataSource = self
        tblView.delegate = self
        tblView.register(TrayViewCell.self, forCellReuseIdentifier: trayId)
        return tblView
    }()
    
    let orderTtlDvd: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(white: 0.9, alpha: 1)
        return view
    }()
    
    let orderTtlLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Total"
        lbl.textColor = .darkGray
        lbl.textAlignment = .left
        lbl.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return lbl
    }()
    
    let ttlLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "$1000.99"
        lbl.textAlignment = .right
        lbl.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return lbl
    }()
    
    let ttlAddrDvd: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(white: 0.9, alpha: 1)
        return view
    }()
    
    let orderAddrLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Address"
        lbl.textColor = .darkGray
        lbl.textAlignment = .left
        lbl.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return lbl
    }()
    
    let addrTextField: UITextField = {
        let textField = UITextField()
        textField.layer.borderWidth = 1.0
        textField.layer.cornerRadius = 10
        let leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 8.0, height: 32.0))
        textField.leftView = leftView
        textField.leftViewMode = .always
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Enter your address here"
        return textField
    }()
    
    let orderMapView: MKMapView = {
        let mapView = MKMapView()
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.isUserInteractionEnabled = true
        mapView.isZoomEnabled = true
        return mapView
    }()
    
    let totalQuantLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .white
        lbl.textAlignment = .center
        lbl.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        lbl.text = "123"
        return lbl
    }()
    
    lazy var totalQuantView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 20
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 1.5
        
        view.addSubview(totalQuantLbl)
        totalQuantLbl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        totalQuantLbl.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        return view
    }()
    
    lazy var checkoutView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 78/255, green: 176/255, blue: 76/255, alpha: 1)
        view.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(showPaymentVC))
        view.addGestureRecognizer(gesture)
        
        let orderLbl = UILabel()
        orderLbl.translatesAutoresizingMaskIntoConstraints = false
        orderLbl.textColor = .white
        orderLbl.textAlignment = .center
        orderLbl.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        orderLbl.text = "CHECK OUT"
        
        view.addSubview(orderLbl)
        view.addSubview(totalQuantView)
        
        orderLbl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        orderLbl.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        orderLbl.heightAnchor.constraint(equalToConstant: 60).isActive = true
        orderLbl.widthAnchor.constraint(equalToConstant: 144).isActive = true
        
        totalQuantView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -32).isActive = true
        totalQuantView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        totalQuantView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        totalQuantView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        return view
    }()
    
    var arr: [Int] = [1] { // CHANGE TO ORDER OBJECT
        didSet {
            self.orderTblView.reloadData()
            updateList()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let lftBarBtnItem = UIBarButtonItem(image: #imageLiteral(resourceName: "icon_menu_24dp"), style: .plain, target: self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)))
        //lftBarBtnItem.tintColor = view.tintColor
        navigationItem.leftBarButtonItem = lftBarBtnItem

        setupViews()
    }
    
    func setupViews() {
        view.addGestureRecognizer((revealViewController()?.panGestureRecognizer())!)
        
        view.addSubview(orderTblView)
        view.addSubview(placeholderView)
        view.addSubview(orderTtlDvd)
        view.addSubview(orderTtlLbl)
        view.addSubview(ttlLbl)
        view.addSubview(ttlAddrDvd)
        view.addSubview(orderAddrLbl)
        view.addSubview(addrTextField)
        view.addSubview(orderMapView)
       view.addSubview(checkoutView)
        
        orderTblView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        orderTblView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        orderTblView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        orderTblView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        
        placeholderView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        placeholderView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        placeholderView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        placeholderView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        
        orderTtlDvd.topAnchor.constraint(equalTo: orderTblView.bottomAnchor).isActive = true
        orderTtlDvd.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        orderTtlDvd.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        orderTtlDvd.heightAnchor.constraint(equalToConstant: 1.5).isActive = true

        orderTtlLbl.topAnchor.constraint(equalTo: orderTtlDvd.bottomAnchor, constant: 16).isActive = true
        orderTtlLbl.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true

        ttlLbl.topAnchor.constraint(equalTo: orderTtlDvd.bottomAnchor, constant: 16).isActive = true
        ttlLbl.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true

        ttlAddrDvd.topAnchor.constraint(equalTo: ttlLbl.bottomAnchor, constant: 16).isActive = true
        ttlAddrDvd.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        ttlAddrDvd.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        ttlAddrDvd.heightAnchor.constraint(equalToConstant: 1.5).isActive = true

        orderAddrLbl.topAnchor.constraint(equalTo: ttlAddrDvd.bottomAnchor, constant: 16).isActive = true
        orderAddrLbl.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true

        addrTextField.topAnchor.constraint(equalTo: orderAddrLbl.topAnchor, constant: -8).isActive = true
        addrTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        addrTextField.leftAnchor.constraint(equalTo: orderAddrLbl.rightAnchor, constant: 64).isActive = true
        addrTextField.heightAnchor.constraint(equalToConstant: 36).isActive = true

        orderMapView.topAnchor.constraint(equalTo: addrTextField.bottomAnchor, constant: 8).isActive = true
        orderMapView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        orderMapView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        orderMapView.bottomAnchor.constraint(equalTo: checkoutView.topAnchor).isActive = true

        checkoutView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        checkoutView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        checkoutView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        checkoutView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        updateList()
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = orderTblView.dequeueReusableCell(withIdentifier: trayId, for: indexPath) as! TrayViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 84))
        
        let headerLabel = UILabel()
        headerLabel.text = "Your Tray"
        headerLabel.textColor = .black
        headerLabel.textAlignment = .center
        headerLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        
        headerView.addSubview(headerLabel)
        headerLabel.centerYAnchor.constraint(equalTo: headerView.centerYAnchor).isActive = true
        headerLabel.centerXAnchor.constraint(equalTo: headerView.centerXAnchor).isActive = true
        
        return headerView
    }
    
    func updateList() {
        if arr.count == 0 {
            orderTblView.isHidden = true
            placeholderView.isHidden = false
        } else {
            orderTblView.isHidden = false
            placeholderView.isHidden = true
        }
    }
    
    @objc func showPaymentVC() {
        show(PaymentViewController(), sender: self)
    }
}
