//
//  OrderMealViewController.swift
//  Restlivery
//
//  Created by Zain Budhwani on 9/10/19.
//  Copyright © 2019 Zain Budhwani. All rights reserved.
//

import UIKit

class OrderMealViewController: UIViewController {
    
    let orderImg: UIImageView = {
        let iV = UIImageView(image: #imageLiteral(resourceName: "splash_screen"))
        iV.translatesAutoresizingMaskIntoConstraints = false
        iV.contentMode = .scaleAspectFill
        iV.layer.cornerRadius = 125
        iV.clipsToBounds = true
        return iV
    }()
    
    let orderMealLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "This is the name of the meal"
        lbl.textAlignment = .center
        lbl.font = UIFont.systemFont(ofSize: 23, weight: .semibold)
        return lbl
    }()
    
    let orderDvLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "__________"
        lbl.textAlignment = .center
        lbl.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        return lbl
    }()
    
    let orderSDLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Here contains the short description that will be shown in full to the user, so we could probably keep it shorter on the previous cell"
        lbl.textAlignment = .center
        lbl.font = UIFont.systemFont(ofSize: 17)
        lbl.numberOfLines = 4
        lbl.textColor = .darkGray
        return lbl
    }()
    
    let orderPriceLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "$10.00"
        lbl.textAlignment = .center
        lbl.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        lbl.textColor = .darkGray
        return lbl
    }()
    
    let quantLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "0"
        lbl.textAlignment = .center
        lbl.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return lbl
    }()
    
    lazy var orderQuantView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 27
        view.layer.borderColor = UIColor(white: 0.9, alpha: 1).cgColor
        view.layer.borderWidth = 2.0
        
        let minusAttribute = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17, weight: .bold)]
        let addAttribute = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20, weight: .bold)]
        
        let minusBtn = UIButton(type: .custom)
        minusBtn.translatesAutoresizingMaskIntoConstraints = false
        minusBtn.setAttributedTitle(NSAttributedString(string: "—", attributes: minusAttribute), for: .normal)
        minusBtn.addTarget(self, action: #selector(decreaseFromQuantity), for: .touchUpInside)
        
        let addBtn = UIButton(type: .custom)
        addBtn.translatesAutoresizingMaskIntoConstraints = false
        addBtn.setAttributedTitle(NSAttributedString(string: "＋", attributes: addAttribute), for: .normal)
        addBtn.addTarget(self, action: #selector(addToQuantity), for: .touchUpInside)
        
        view.addSubview(minusBtn)
        view.addSubview(quantLbl)
        view.addSubview(addBtn)
        
        minusBtn.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8).isActive = true
        minusBtn.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        minusBtn.widthAnchor.constraint(equalToConstant: 40).isActive = true
        minusBtn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        quantLbl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        quantLbl.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        quantLbl.widthAnchor.constraint(equalToConstant: 50).isActive = true

        addBtn.leftAnchor.constraint(equalTo: quantLbl.rightAnchor, constant: 16).isActive = true
        addBtn.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -8).isActive = true
        addBtn.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        addBtn.widthAnchor.constraint(equalToConstant: 40).isActive = true
        addBtn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        return view
    }()
    
    let subtotalLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .white
        lbl.textAlignment = .right
        lbl.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        lbl.text = "$0.00"
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
        orderLbl.text = "ADD TO TRAY"
        
        view.addSubview(orderLbl)
        view.addSubview(subtotalLbl)
        
        orderLbl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        orderLbl.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        orderLbl.heightAnchor.constraint(equalToConstant: 60).isActive = true
        orderLbl.widthAnchor.constraint(equalToConstant: 144).isActive = true
        
        subtotalLbl.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        subtotalLbl.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        subtotalLbl.heightAnchor.constraint(equalToConstant: 60).isActive = true
        subtotalLbl.widthAnchor.constraint(equalToConstant: 80).isActive = true

        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let rightBarBtnItem = UIBarButtonItem(image: #imageLiteral(resourceName: "icon_tray"), style: .plain, target: self, action: #selector(showTrayVC))
        rightBarBtnItem.tintColor = view.tintColor
        navigationItem.rightBarButtonItem = rightBarBtnItem
        rightBarBtnItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -26)

        setupViews()
    }
    
    func setupViews() {
        view.addSubview(orderImg)
        view.addSubview(orderMealLbl)
        view.addSubview(orderDvLbl)
        view.addSubview(orderSDLbl)
        view.addSubview(orderPriceLbl)
        view.addSubview(orderQuantView)
        view.addSubview(orderView)
        
        orderImg.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        orderImg.bottomAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        orderImg.widthAnchor.constraint(equalToConstant: 250).isActive = true
        orderImg.heightAnchor.constraint(equalToConstant: 250).isActive = true
        
        orderMealLbl.topAnchor.constraint(equalTo: orderImg.bottomAnchor, constant: 32).isActive = true
        orderMealLbl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        orderDvLbl.topAnchor.constraint(equalTo: orderMealLbl.bottomAnchor, constant: 6).isActive = true
        orderDvLbl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        orderSDLbl.topAnchor.constraint(equalTo: orderDvLbl.bottomAnchor, constant: 24).isActive = true
        orderSDLbl.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 48).isActive = true
        orderSDLbl.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -48).isActive = true
        orderSDLbl.heightAnchor.constraint(equalToConstant: 82).isActive = true
        
        orderPriceLbl.topAnchor.constraint(equalTo: orderSDLbl.bottomAnchor, constant: 24).isActive = true
        orderPriceLbl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        orderQuantView.topAnchor.constraint(equalTo: orderPriceLbl.bottomAnchor, constant: 24).isActive = true
        orderQuantView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        orderQuantView.widthAnchor.constraint(equalToConstant: 164).isActive = true
        orderQuantView.heightAnchor.constraint(equalToConstant: 54).isActive = true
        
        orderView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        orderView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        orderView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        orderView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    @objc func addToQuantity() {
        let value = quantLbl.text!
        if value == "999" { return }
        let newQuant = Int(value)! + 1
        quantLbl.text = String(newQuant)
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        
        if let number = formatter.number(from: orderPriceLbl.text!) {
            let amount = Double(truncating: number.decimalValue as NSNumber) * Double(newQuant)
            subtotalLbl.text = String(format: "$%.02f", amount)
        }
        
    }
    
    @objc func decreaseFromQuantity() {
        let value = quantLbl.text!
        if value == "0" { return }
        let newQuant = Int(value)! - 1
        quantLbl.text = String(newQuant)
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        
        if let number = formatter.number(from: orderPriceLbl.text!) {
            let amount = Double(truncating: number.decimalValue as NSNumber) * Double(newQuant)
            subtotalLbl.text = String(format: "$%.02f", amount)
        }
    }
    
    @objc func showTrayVC() {
        show(TrayViewController(), sender: self)
    }
}
