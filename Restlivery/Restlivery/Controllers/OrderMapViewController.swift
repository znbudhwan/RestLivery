//
//  OrderMapViewController.swift
//  Restlivery
//
//  Created by Zain Budhwani on 9/11/19.
//  Copyright © 2019 Zain Budhwani. All rights reserved.
//

import UIKit
import MapKit

class OrderMapViewController: UIViewController {
    
    let orderMapView: MKMapView = {
        let mapView = MKMapView()
        mapView.translatesAutoresizingMaskIntoConstraints = false
        return mapView
    }()
    
    var originalPullUpControllerViewSize: CGSize = .zero
    
    func setupViews() {
        view.addSubview(orderMapView)
        
        orderMapView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        orderMapView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        orderMapView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        orderMapView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    private func makeOrderInfoViewControllerIfNeeded() -> OrderInfoViewController {
        let currentPullUpController = children
            .filter({ $0 is OrderInfoViewController })
            .first as? OrderInfoViewController
        let pullUpController: OrderInfoViewController = currentPullUpController ?? OrderInfoViewController()
        
        pullUpController.initialState = .contracted
        
        if originalPullUpControllerViewSize == .zero {
            originalPullUpControllerViewSize = pullUpController.view.bounds.size
        }
        return pullUpController
    }
    
    private func addPullUpController() {
        let pullUpController = makeOrderInfoViewControllerIfNeeded()
        _ = pullUpController.view
        addPullUpController(pullUpController,
                            initialStickyPointOffset: pullUpController.initialPointOffset,
                            animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        addPullUpController()
    }
}
