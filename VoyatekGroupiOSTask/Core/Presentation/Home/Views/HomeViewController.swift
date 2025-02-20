//
//  HomeViewController.swift
//  VoyatekGroupiOSTask
//
//  Created by Danjuma Nasiru on 19/02/2025.
//

import UIKit
import SwiftUI

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setToolbar()
        
        var swiftUIView = HomeView()
        swiftUIView.navigateToAddFood = gotoAddView
        let hostingController = UIHostingController(rootView: swiftUIView)
        
        addChild(hostingController)
        view.addSubview(hostingController.view)
        
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        hostingController.didMove(toParent: self)
    }
    
    func setToolbar() {
        let bellImage = UIHostingController(rootView: NotificationsBell())
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: bellImage.view)
        
        let displayPcture = UIHostingController(rootView: DisplayPicture())
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: displayPcture.view)
    }
    
    func gotoAddView(categories: [Category]) {
        let addFoodController = AddFoodViewController()
        addFoodController.categories = categories
        navigationController?.pushViewController(addFoodController, animated: true)
    }
}
