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
//判断iPhone4
let IPHONE4_DEV:Bool! = (SCREEN_HEIGHT == 480) ? true : false

//判断iPhone5/5c/5s
let IPHONE5_DEV:Bool! = (SCREEN_HEIGHT == 568) ? true : false

//判断iPhone6/6s
let IPHONE6s_DEV:Bool! = (SCREEN_HEIGHT == 667) ? true : false

//判断iPhone6p
let IPHONE6p_DEV:Bool! = (SCREEN_HEIGHT == 736) ? true : false

//判断iPad
let IPAD_DEV:Bool! = (UIDevice.current.userInterfaceIdiom == .pad) ? true : false

//判断iPhoneX
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

func ImageWithName(name:String) ->UIImage {
    return UIImage.init(named: name)!
}

func realWidth(width:CGFloat) ->CGFloat {
    return width/1080.0
}


// 取舍器界面图片资源名称
let alphaMinValue:Float = 0.3
let alphaMaxValue:Float = 1.0
let alphaCurrentValue:Float = 0.3
let alphaThubImageName:String = "slider_thumb"
let alphaMinTrackImageName:String = "slider_minTrack"
let alphaMaxTrackImageName:String = "slider_backgroundTrack"
let addImageName:String = "slider_plus"
let subImageName:String = "slider_sub"
let pickerBackgroundImageName:String = "colorPickerBackground"
let ligthButtonOnImageName:String = "light_selected"
let lightButtonOffImageName:String = "picker_light"


