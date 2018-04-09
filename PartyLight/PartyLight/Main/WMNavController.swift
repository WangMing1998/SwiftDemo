//
//  WMNavController.swift
//  PartyLight
//
//  Created by Heaton on 2018/4/6.
//  Copyright © 2018年 WangMingDeveloper. All rights reserved.
//

import UIKit

class WMNavController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.isNavigationBarHidden = true// 显示navgitonBar
        self.isToolbarHidden = true
    }
    
    // 重写跳转
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.viewControllers.count > 0{
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: true)
    }
}
