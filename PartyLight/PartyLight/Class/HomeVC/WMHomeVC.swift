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
    let pickerVC:WMPickerColorVC = WMPickerColorVC()
    let viewContainer:UIView = UIView()
    override func viewDidLoad() {
        super.viewDidLoad()
        // 图片大小501 * 169
        let topViewHeight = SCREEN_WIDTH * CGFloat((169.0 / BaseWidth))
        let yPosition:CGFloat = ISIPHONEX ? (20.0+24.0+25.0):(20.0+25.0)
        let topMeumView = UIView.init(frame:CGRect(x: 0.0, y:yPosition, width:SCREEN_WIDTH, height:topViewHeight))
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
        
        
        // 添加控制器
//        pickerVC.view.frame = view.bounds;
        let y:CGFloat = (topMeumView.y) + (topMeumView.height);
        viewContainer.frame = CGRect(x: 0, y:y, width: SCREEN_WIDTH, height: view.height - (y+topMeumView.height + yPosition))
//        viewContainer.backgroundColor = UIColor.yellow.withAlphaComponent(0.3)
        view.addSubview(viewContainer)
        
        pickerVC.view.frame = CGRect(x: 0, y: 0, width: viewContainer.width, height: viewContainer.height)
        viewContainer.addSubview(pickerVC.view);
        
        
    }
    
    @objc func topButtonsTapped(sender:UIButton){
        if current == sender.tag{
            return;
        }
        if sender.tag == 0{
            leftButton?.isSelected = true
            rightButton?.isSelected = false
            UIView.animate(withDuration: 0.5, animations: {
                self.pickerVC.view.isHidden = false
                self.viewContainer.addSubview(self.pickerVC.view)
            })
            
        }else{
            leftButton?.isSelected = false
            rightButton?.isSelected = true
            UIView.animate(withDuration: 0.5, animations: {
                self.pickerVC.view.isHidden = true
                self.pickerVC.view.removeFromSuperview()
            })
            
        }
        current = sender.tag;
        
    }
}
