//
//  WMHomeVC.swift
//  PartyLight
//
//  Created by Heaton on 2018/4/6.
//  Copyright © 2018年 WangMingDeveloper. All rights reserved.
//

import UIKit

class WMHomeVC: UIViewController {
    var current = 0;
    var leftButton:UIButton?
    var rightButton:UIButton?
    override func viewDidLoad() {
        super.viewDidLoad()
        // 图片大小501 * 169
        let topViewHeight = SCREEN_WIDTH * CGFloat((169.0 / BaseWidth))
        let yPosition = ISIPHONEX ? (20.0+24.0+25.0):(20.0+25.0)
        let topMeumView = UIView.init(frame:CGRect(x: 0.0, y:Double(yPosition), width:Double(SCREEN_WIDTH), height:Double(topViewHeight)))
        view.addSubview(topMeumView)
        
        // 添加两个按钮
        let buttonWidth = topViewHeight/(169.0/501.0);
        let space = (SCREEN_WIDTH - 2 * buttonWidth)/3.0
        
        leftButton = UIButton.init(frame: CGRect(x: space, y: 0, width: buttonWidth, height: topViewHeight))
        leftButton?.setBackgroundImage(UIImage.init(named: "color_picker_normal"), for: .normal)
        leftButton?.setBackgroundImage(UIImage.init(named: "color_picker_selected"), for: .selected)
        leftButton?.setTitle("颜色调节", for:.normal)
        leftButton?.setTitleColor(UIColor.purple, for:.normal)
        leftButton?.isSelected = true
        leftButton?.tag = 0;
        topMeumView.addSubview(leftButton!)
        leftButton?.addTarget(self, action:#selector(topButtonsTapped(sender:)), for:.touchUpInside)
        
        rightButton = UIButton.init(frame: CGRect(x: space * 2 + buttonWidth, y: 0, width: buttonWidth, height: topViewHeight))
        rightButton?.setBackgroundImage(UIImage.init(named: "color_picker_normal"), for: .normal)
        rightButton?.setBackgroundImage(UIImage.init(named: "color_picker_selected"), for: .selected)
        rightButton?.setTitle("预设模式", for:.normal)
        rightButton?.setTitleColor(UIColor.purple, for:.normal)
        rightButton?.tag = 1;
        topMeumView.addSubview(rightButton!)
        rightButton?.addTarget(self, action:#selector(topButtonsTapped(sender:)), for:.touchUpInside)
        
        
    }
    
    @objc func topButtonsTapped(sender:UIButton){
        if current == sender.tag{
            return;
        }
        if sender.tag == 0{
            leftButton?.isSelected = true
            rightButton?.isSelected = false
        }else{
            leftButton?.isSelected = false
            rightButton?.isSelected = true
        }
        current = sender.tag;
        
    }
}
