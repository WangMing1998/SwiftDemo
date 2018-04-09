//
//  WMTabBar.swift
//  PartyLight
//
//  Created by Heaton on 2018/4/7.
//  Copyright © 2018年 WangMingDeveloper. All rights reserved.
//

import UIKit

@objc protocol WMTabBarDelegate{
    @objc optional  func xWMTabBar(tabBar:WMTabBar,didselectedIndex selectedIndex:Int)
}

class WMTabBar: UIView {
    
    private var backgroundImageView:UIImageView!
    private var titlesArray:[String]=["调色","音乐","设备","设置"]
    private var nor_imagesArray:[String]=["tabbar_color","tabbar_music","tabbar_device","tabbar_music"]
    private var sel_imagesArray:[String]=["tabbar_color_s","tabbar_music_s","tabbar_device_s","tabbar_music_s"]
    weak var delegate:WMTabBarDelegate?
    override init(frame: CGRect) {
        super.init(frame: frame);
        setupSubviews();
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSubviews(){
        // 添加背景图片
        backgroundImageView = UIImageView.init(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        backgroundImageView.image = UIImage.init(named:"tabBarBackground")
        backgroundImageView.contentMode = UIViewContentMode.scaleAspectFill
        backgroundImageView.isUserInteractionEnabled = true
        addSubview(backgroundImageView);
        
        let heigt = self.frame.size.height
        let width = self.frame.size.width/4
        
        
        for (index,value) in titlesArray.enumerated() {
            //index是下标，value是值
            let button = WMButton.init(frame:CGRect(x:CGFloat(index) * width, y: 0, width: width, height: heigt))
            button.setTitle(value, for: UIControlState.normal)
            index == 0 ? (button.isSelected = true):(button.isSelected = false)
            button.set(image:UIImage.init(named: nor_imagesArray[index]), title: value, titlePosition: .bottom, additionalSpacing: 5, state: .normal)
            button.set(image:UIImage.init(named: sel_imagesArray[index]), title: value, titlePosition: .bottom, additionalSpacing: 5, state: .selected)
            button.setTitleColor(UIColor.purple, for: .normal)
            button.tag = index
            button.addTarget(self, action: #selector(buttonTapped(sender:)), for: .touchUpInside)
            backgroundImageView.addSubview(button)
//            view.addSubview(btn4)
            
        }
        
    }
    
    @objc func buttonTapped(sender:UIButton){
        for btn in backgroundImageView.subviews {
            guard let btn = btn as? UIButton else { continue }
            btn.isSelected = false
        }
        
        sender.isSelected = true
        if let ret = self.delegate{
            ret.xWMTabBar?(tabBar: self, didselectedIndex: sender.tag)
        }
        
    }
    
    
}
