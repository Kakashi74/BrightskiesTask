//
//  TabVC.swift
//  BrightskiesTask
//
//  Created by Ahmed on 6/11/21.
//  Copyright © 2021 eramint.com. All rights reserved.
//

import UIKit

class TabVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        tabBar.items?.forEach({ $0.titlePositionAdjustment = UIOffset(horizontal: 0.0, vertical: 0.0) })
    }
}
