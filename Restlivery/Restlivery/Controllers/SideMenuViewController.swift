//
//  SideMenuViewController.swift
//  Restlivery
//
//  Created by Zain Budhwani on 9/6/19.
//  Copyright © 2019 Zain Budhwani. All rights reserved.
//

import UIKit

class SideMenuViewController: UITableViewController {
    
    var cells = [(UIImage, String)]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = .white
        
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
        headerLabel.textColor = UIColor(red: 232/255, green: 63/255, blue: 111/255, alpha: 1.0)
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        
        headerView.addSubview(headerLabel)
        headerLabel.leftAnchor.constraint(equalTo: headerIcon.rightAnchor, constant: 12).isActive = true
        headerLabel.centerYAnchor.constraint(equalTo: headerView.centerYAnchor).isActive = true
        
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            revealViewController()?.pushFrontViewController(UINavigationController(rootViewController: SearchViewController()), animated: true)
        } else if indexPath.row == 1 {
            revealViewController()?.pushFrontViewController(UINavigationController(rootViewController: TrayViewController()), animated: true)
        } else if indexPath.row == 2 {
            revealViewController()?.pushFrontViewController(UINavigationController(rootViewController: OrderMapViewController()), animated: true)
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 110
    }
    
}
