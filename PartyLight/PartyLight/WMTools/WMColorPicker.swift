//
//  WMColorPicker.swift
//  PartyLight
//
//  Created by Heaton on 2018/4/9.
//  Copyright © 2018年 WangMingDeveloper. All rights reserved.
//

import UIKit
//import QuartzCore
//import CoreImage
//import Foundation
// 角度转弧度
func ToRad(deg:Double)->Double{
    return  ((Double.pi * deg) / 180.0)
}

// 弧度转角度
func ToDeg(rad:Double)->Double{
    return   ((180.0 * rad) / Double.pi)
}

func SQR(x:CGFloat)->CGFloat{
    return x * x
}

func SCALE(size:Double)->Double{
    return floor(Double((SCREEN_WIDTH / 320.0)) * size)
}


class WMColorPicker: UIControl {
   
    
    private let Selector_width = SQR(x: 70)
    private var handleCenter:CGPoint?
    private var radius = 0.0
    private var context:CGContext?
    private var selectorImageView:UIImageView?
    private var colorsImgeView:UIImageView?
    var angle = 360.0
    override init(frame: CGRect) {
        super.init(frame: frame)
        isOpaque = false
        radius = Double(frame.size.width) / 2.0
        
        colorsImgeView = UIImageView.init(image: UIImage.init(named: "colorView"))
        colorsImgeView?.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        addSubview(colorsImgeView!);
        
        let xPosition = frame.width - Selector_width
        let yPosition = frame.height/2 - Selector_width/2
        
        selectorImageView = UIImageView.init(image: UIImage.init(named: "color_picker_selector"))
        selectorImageView?.frame = CGRect(x: xPosition, y:yPosition, width:Selector_width, height: Selector_width)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 更新滑帽的位置
    fileprivate func updatePositionForSelectorImage(){
//        CGPoint handleCenter =
    }
  
   
    // 给定的角度得到圆环上对应的经纬度
    fileprivate func pointFromAngle(angleInt:int)->{
        var result:CGPoint?
        let centerPoint = CGPoint(x: frame.width/2-Selector_width/2, y: frame.height/2-Selector_width/2)
        result?.x = round(Double(centerPoint.y) + radius * sin(ToDeg(rad: Double(-angleInt))))
    }
    
}
