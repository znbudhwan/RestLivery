//
//  PaymentViewController.swift
//  Restlivery
//
//  Created by Zain Budhwani on 9/11/19.
//  Copyright © 2019 Zain Budhwani. All rights reserved.
//

import UIKit
import Stripe

class PaymentViewController: UIViewController {
    
    let paymentAddrLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Address"
        lbl.textColor = .darkGray
        lbl.textAlignment = .left
        lbl.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return lbl
    }()
    
    let addrLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "123 Your address is this, ST, 99999"
        lbl.numberOfLines = 2
        lbl.textAlignment = .right
        lbl.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return lbl
    }()
    
    let addrTtlDvd: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(white: 0.9, alpha: 1)
        return view
    }()
    
    let paymentTtlLbl: UILabel = {
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
        lbl.text = "$100.99"
        lbl.textAlignment = .right
        lbl.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return lbl
    }()
    
    let ttlPaymentDvd: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(white: 0.9, alpha: 1)
        return view
    }()
    
    let paymentTxtField: STPPaymentCardTextField = {
        let txtField = STPPaymentCardTextField()
        txtField.translatesAutoresizingMaskIntoConstraints = false
        return txtField
    }()
    
    let subtotalLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .white
        lbl.textAlignment = .right
        lbl.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        lbl.text = "($100.00)"
        return lbl
    }()
    
    lazy var orderView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 78/255, green: 176/255, blue: 76/255, alpha: 1)
        
        let orderLbl = UILabel()
        orderLbl.translatesAutoresizingMaskIntoConstraints = false
        orderLbl.textColor = .white
        orderLbl.textAlignment = .center
        orderLbl.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        orderLbl.text = "PLACE ORDER"
        
        view.addSubview(orderLbl)
        view.addSubview(subtotalLbl)
        
        orderLbl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        orderLbl.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        orderLbl.heightAnchor.constraint(equalToConstant: 60).isActive = true
        orderLbl.widthAnchor.constraint(equalToConstant: 144).isActive = true
        
        subtotalLbl.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -32).isActive = true
        subtotalLbl.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        subtotalLbl.heightAnchor.constraint(equalToConstant: 60).isActive = true
        subtotalLbl.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
    }
    
    func setupViews() {
        let guide = view.safeAreaLayoutGuide
        
        view.addSubview(paymentAddrLbl)
        view.addSubview(addrLbl)
        view.addSubview(addrTtlDvd)
        view.addSubview(paymentTtlLbl)
        view.addSubview(ttlLbl)
        view.addSubview(ttlPaymentDvd)
        view.addSubview(paymentTxtField)
        view.addSubview(orderView)
        
        paymentAddrLbl.leftAnchor.constraint(equalTo: guide.leftAnchor, constant: 32).isActive = true
        paymentAddrLbl.topAnchor.constraint(equalTo: guide.topAnchor, constant: view.frame.height * 0.15).isActive = true
        
        addrLbl.leftAnchor.constraint(equalTo: paymentAddrLbl.rightAnchor, constant: 72).isActive = true
        addrLbl.rightAnchor.constraint(equalTo: guide.rightAnchor, constant: -32).isActive = true
        addrLbl.topAnchor.constraint(equalTo: guide.topAnchor, constant: view.frame.height * 0.15).isActive = true
        
        addrTtlDvd.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        addrTtlDvd.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        addrTtlDvd.topAnchor.constraint(equalTo: addrLbl.bottomAnchor, constant: 16).isActive = true
        addrTtlDvd.heightAnchor.constraint(equalToConstant: 1.5).isActive = true
        
        paymentTtlLbl.leftAnchor.constraint(equalTo: guide.leftAnchor, constant: 32).isActive = true
        paymentTtlLbl.topAnchor.constraint(equalTo: addrTtlDvd.bottomAnchor, constant: 32).isActive = true
        
        ttlLbl.leftAnchor.constraint(equalTo: paymentTtlLbl.rightAnchor, constant: 72).isActive = true
        ttlLbl.rightAnchor.constraint(equalTo: guide.rightAnchor, constant: -32).isActive = true
        ttlLbl.topAnchor.constraint(equalTo: addrTtlDvd.bottomAnchor, constant: 32).isActive = true
        
        ttlPaymentDvd.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        ttlPaymentDvd.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        ttlPaymentDvd.topAnchor.constraint(equalTo: ttlLbl.bottomAnchor, constant: 32).isActive = true
        ttlPaymentDvd.heightAnchor.constraint(equalToConstant: 1.5).isActive = true
        
        paymentTxtField.leftAnchor.constraint(equalTo: guide.leftAnchor, constant: 32).isActive = true
        paymentTxtField.rightAnchor.constraint(equalTo: guide.rightAnchor, constant: -32).isActive = true
        paymentTxtField.topAnchor.constraint(equalTo: ttlPaymentDvd.bottomAnchor, constant: 32).isActive = true
        paymentTxtField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        orderView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        orderView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        orderView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        orderView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
}
