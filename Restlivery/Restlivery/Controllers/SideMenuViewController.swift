//
//  SideMenuViewController.swift
//  Restlivery
//
//  Created by Zain Budhwani on 9/6/19.
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
        lbl.textColor = .lightGray
        return lbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor(red: 36/255, green: 33/255, blue: 62/255, alpha: 1.0)
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

class SideMenuViewController: UITableViewController {
    
    var cells = [(UIImage, String)]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = UIColor(red: 36/255, green: 33/255, blue: 62/255, alpha: 1.0)
        
        cells.append((#imageLiteral(resourceName: "icon_restaurants"), "Restaurants"))
        cells.append((#imageLiteral(resourceName: "icon_tray"), "Tray"))
        cells.append((#imageLiteral(resourceName: "icon_order"), "Order"))
        cells.append((#imageLiteral(resourceName: "icon_logout"), "Logout"))
        tableView.register(SideMenuCell.self, forCellReuseIdentifier: "SideMenuCell")
        tableView.tableFooterView = UIView()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SideMenuCell", for: indexPath) as? SideMenuCell
        cell?.menuIcon.image = cells[indexPath.row].0
        cell?.menuLabel.text = cells[indexPath.row].1
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 110))
        
        let headerIcon = UIImageView()
        headerIcon.image = #imageLiteral(resourceName: "placeholder")
        headerIcon.translatesAutoresizingMaskIntoConstraints = false
        
        headerView.addSubview(headerIcon)
        headerIcon.centerYAnchor.constraint(equalTo: headerView.centerYAnchor).isActive = true
        headerIcon.leftAnchor.constraint(equalTo: headerView.leftAnchor, constant: 16).isActive = true
        headerIcon.widthAnchor.constraint(equalToConstant: 60).isActive = true
        headerIcon.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        let headerLabel = UILabel()
        headerLabel.text = "Placeholder Name"
        headerLabel.textColor = .lightGray
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        
        headerView.addSubview(headerLabel)
        headerLabel.leftAnchor.constraint(equalTo: headerIcon.rightAnchor, constant: 12).isActive = true
        headerLabel.centerYAnchor.constraint(equalTo: headerView.centerYAnchor).isActive = true
        
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //revealViewController()
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 110
    }
    
}
