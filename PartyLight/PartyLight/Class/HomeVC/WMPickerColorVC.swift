//
//  WMPickerColorVC.swift
//  PartyLight
//
//  Created by Heaton on 2018/4/13.
//  Copyright © 2018年 WangMingDeveloper. All rights reserved.
//

import UIKit

class WMPickerColorVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = UIColor.red
        // 添加拾色器
        let colorPicker = WMColorPicker.init(frame: CGRect(x:0, y:view.height/2 - 150 - view.y, width: 300, height: 300))
        colorPicker.addTarget(self, action: #selector(colorChange(sender:)), for:.valueChanged)
//        colorPicker.center = view.center
        colorPicker.centerX = view.centerX
        colorPicker.backgroundColor = UIColor.yellow.withAlphaComponent(0.5)
        view.addSubview(colorPicker)
      
    }

    
    @objc func colorChange(sender:WMColorPicker){

        print("sender.currentColor",sender.currentColor)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
