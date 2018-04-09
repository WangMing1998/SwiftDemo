//
//  PrefixHeader.swift
//  PartyLight
//
//  Created by Heaton on 2018/4/9.
//  Copyright © 2018年 WangMingDeveloper. All rights reserved.
//

import UIKit

let SCREEN_WIDTH  =  UIScreen.main.bounds.size.width
let SCREEN_HEIGHT =  UIScreen.main.bounds.size.height
let ISIPHONEX     = UIScreen.main.bounds.size.height == 812 ? true: false

let WMHeightCoefficient  = ISIPHONEX ? 667.0/667.0 : SCREEN_HEIGHT/667.0
let SafeAreaTopHeight    = ISIPHONEX ? 88 : 64
let SafeAreaBottomHeight = ISIPHONEX ? 34 : 0
let TabBarHeight         = ISIPHONEX ? 83 : 0

let BaseWidth:CGFloat = 1080.0


func RGBColor(r:CGFloat,g:CGFloat,b:CGFloat) -> UIColor
{
    return UIColor(red: (r)/255.0, green: (g)/255.0, blue: (b)/255.0, alpha: 1.0)
}


func RGBCOLOR_HEX(h:Int) ->UIColor {
    return RGBColor(r: CGFloat(((h)>>16) & 0xFF), g:   CGFloat(((h)>>8) & 0xFF), b:  CGFloat((h) & 0xFF))
}

