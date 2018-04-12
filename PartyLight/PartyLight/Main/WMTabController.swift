//
//  WMTabController.swift
//  PartyLight
//
//  Created by Heaton on 2018/4/6.
//  Copyright © 2018年 WangMingDeveloper. All rights reserved.
//

import UIKit

   class WMTabController: UIViewController,WMTabBarDelegate{
   
    var  placeView:UIView?
    var  currentIndex = 0
    var testview:UIView?
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTabbar()
        addViewController()
        let colorPicker = WMColorPicker.init(frame: CGRect(x:(self.view.frame.size.width - 300.0)/2, y: (self.view.frame.size.height - 300.0)/2, width: 300, height: 300))
        colorPicker .addTarget(self, action: #selector(colorChange(sender:)), for:.valueChanged)
        view.addSubview(colorPicker)
        
        testview = UIView.init(frame: CGRect(x:50, y: 100, width: 100, height: 100))
        testview?.backgroundColor = UIColor.red;
        view.addSubview(testview!);
        
    
    }
    
    @objc func colorChange(sender:WMColorPicker){
     testview?.backgroundColor = sender.currentColor
    }
  
    fileprivate func setUpTabbar() {
        // 添加背景视图
        let backgroundImage = UIImageView.init(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage.init(named: "background")
        view.addSubview(backgroundImage);
        
        // 添加自定义tabBar
        let TabBarHeight = SCREEN_WIDTH * (278/1080)
        let tabBarView = WMTabBar.init(frame: CGRect(x: 0, y: ISIPHONEX ? SCREEN_HEIGHT - TabBarHeight-34:SCREEN_HEIGHT - TabBarHeight, width:SCREEN_WIDTH, height: TabBarHeight))
        tabBarView.delegate = self
        view.addSubview(tabBarView);
        
        // 添加站位view
        placeView = UIView.init(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT - TabBarHeight))
//        placeView?.backgroundColor = UIColor.red.withAlphaComponent(0.3)
        view.addSubview(placeView!)
    }
    
    fileprivate func addViewController() {
        // 默认添加首页
        let homeVC = WMHomeVC();
        homeVC.view.frame = (placeView?.frame)!
        placeView?.addSubview(homeVC.view)
        addChildViewController(homeVC)
        
        addChildViewController(WMPlayerVC())
        addChildViewController(WMDeviceVC())
        addChildViewController(WMSettingVC())
    }
    
    func xWMTabBar(tabBar: WMTabBar, didselectedIndex selectedIndex: Int) {
        if currentIndex == selectedIndex{
            return;
        }
        // 移除当前view
        let lastIndex = currentIndex
        let lastVC = childViewControllers[lastIndex]
        lastVC.view .removeFromSuperview()
        
        // 添加当前view
        
        currentIndex = selectedIndex;
        let currentVC = self.childViewControllers[currentIndex]
        currentVC.view.frame = (placeView?.frame)!
        placeView?.addSubview(currentVC.view)
        
        print("选择了控制器",selectedIndex)
    }

}

