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

func SCALE(size:Double)->CGFloat{
    return CGFloat(floor(Double((SCREEN_WIDTH / 320.0)) * size))
}


class WMColorPicker: UIControl {
    private let Selector_width:CGFloat = SCALE(size: 60.0)
    private var handleCenter:CGPoint?
    private var radius:CGFloat = 0.0
    private var context:CGContext?
    private var selectorImageView:UIImageView?
    private var colorsImgeView:UIImageView?
    private var colorsImage:UIImage?
    private var angle:Int = 360
    var currentColor:UIColor?

    override init(frame: CGRect) {
        super.init(frame: frame)
        isOpaque = false
        radius = frame.size.width/2.0                                             
        if(UIScreen.main.bounds.width == 414){
            radius = frame.width/2.0 - Selector_width/1.5
        }
        colorsImage = UIImage.init(named:"color_picker_cycle")!
        colorsImgeView = UIImageView.init(image: UIImage.init(named: "color_picker_cycle"))
        colorsImgeView?.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        addSubview(colorsImgeView!);
        
        let xPosition = frame.width - Selector_width
        let yPosition = frame.height/2 - Selector_width/2
        
        selectorImageView = UIImageView.init(image: UIImage.init(named: "color_picker_selector"))
        selectorImageView?.frame = CGRect(x: xPosition, y:yPosition, width:Selector_width, height: Selector_width)
        addSubview(selectorImageView!)

        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        updatePositionForSelectorImage()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 更新滑帽的位置
    fileprivate func updatePositionForSelectorImage(){
        let handle = pointFromAngle(angleInt:angle)
        selectorImageView?.frame = CGRect(x: handle.x, y: handle.y, width: Selector_width, height: Selector_width)
        let centerPoint = CGPoint(x: (selectorImageView?.center.x)!, y: (selectorImageView?.center.y)!)
        print("centerX",centerPoint.x,"centerY",centerPoint.y)
    }
  
   
    // 给定的角度得到圆环上对应的经纬度
    fileprivate func pointFromAngle(angleInt:Int)->CGPoint{
        var result = CGPoint(x: 0, y: 0)
        let centerPoint = CGPoint(x: frame.width/2.0-Selector_width/2.0, y: frame.height/2.0-Selector_width/2.0)
        result.y = CGFloat(round(Double(centerPoint.y) + Double(radius) * sin(ToRad(deg: Double(-angleInt)))))
        result.x = CGFloat(round(Double(centerPoint.x) + Double(radius) * cos(ToRad(deg: Double(-angleInt)))))
        handleCenter = CGPoint(x: (result.x)+20.0, y: (result.y)+20.0)
        return result
        
    }
    
    // 计算角度
    fileprivate func angleFromNorth(p1:CGPoint,p2:CGPoint,flipped:Bool)->CGFloat{
        var v = CGPoint(x: p2.x - p1.x, y: p2.y-p1.y)
        let vmag = sqrt(SQR(x: v.x)+SQR(x: v.y))
        v.x /= vmag
        v.y /= vmag
        let radians = atan2(v.y, v.x)
        let result = ToDeg(rad: Double(radians))
        return (CGFloat(result >= 0 ? result:result + 360.0))
        
    }
    
    // 从图片上取色
//    fileprivate func getColorWithImage(image:UIImage,point:CGPoint)->UIColor{
//        let pointX = trunc(point.x)
//        let pointY = trunc(point.y)
//        let cgImage = image.cgImage
//        let width = frame.width
//        let height = frame.height
//        let colorSpace = CGColorSpaceCreateDeviceRGB()
//        let bytesPerPixel:Int = 4
//        let bytesPerRow = bytesPerPixel * 1
//        let bitsPerComponent:UInt = 8
//        let pixeData:UnsafeMutablePointer<CGFloat> = UnsafeMutablePointer<CGFloat>.allocate(capacity: 4)
//        let bitmapInfo = CGBitmapInfo(rawValue: CGBitmapInfo.byteOrder32Big.rawValue | CGImageAlphaInfo.premultipliedLast.rawValue)
//        let context : CGContext = CGContext(data: pixeData,
//                                            width: 1,
//                                            height: 1,
//                                            bitsPerComponent: Int(bitsPerComponent),
//                                            bytesPerRow: bytesPerRow,
//                                            space: colorSpace,
//                                            bitmapInfo: bitmapInfo.rawValue)!
//
//        context.setBlendMode(.copy)
//        context.translateBy(x: -pointX, y: (pointY - CGFloat(height)))
//        let drawIn = CGRect(x: 0.0, y: 0.0, width: width, height: height)
//        context.draw(cgImage!, in:drawIn , byTiling: true)
//        let getColor:UIColor = UIColor(red: pixeData[0] / 255.0, green: pixeData[1] / 255.0, blue:pixeData[2] / 255.0, alpha: pixeData[3] / 255.0)
//        return getColor
//     }
//
    fileprivate func getColorWithImage(image:UIImage,point:CGPoint)->UIColor{
        let pixelData = CGDataProvider.init(data:CGImageGetDataProvider((colorsImage?.cgImage)!) as! CFData)
        let data:UnsafePointer<UInt8> = CFDataGetBytePtr(pixelData as! CFData)
        let pixelInfo: Int = ((Int(frame.width) * Int(point.y)) + Int(point.x)) * 4
        let r = CGFloat(data[pixelInfo]) / CGFloat(255.0)
        let g = CGFloat(data[pixelInfo+1]) / CGFloat(255.0)
        let b = CGFloat(data[pixelInfo+2]) / CGFloat(255.0)
        let a = CGFloat(data[pixelInfo+3]) / CGFloat(255.0)
        let getColor = UIColor(red: r, green: g, blue: b, alpha:a)
        return getColor
    }
    
    
    // 触摸事件
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        super.beginTracking(touch, with: event)
        updataValueWithTouch(touch: touch)
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        super.continueTracking(touch, with: event)
        updataValueWithTouch(touch: touch)
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        super.endTracking(touch, with: event)
        updataValueWithTouch(touch: touch!)
    }
    
    fileprivate func updataValueWithTouch(touch:UITouch){
        let lastPoint = touch.location(in:colorsImgeView)
        moveHandle(point: lastPoint)
        self.sendActions(for: UIControlEvents.valueChanged)
    }
    
    fileprivate func moveHandle(point:CGPoint){
        // 计算图片旋转角度
        let centerPoint = CGPoint(x: frame.width/2, y: frame.height/2)
        let floatAngle = angleFromNorth(p1: centerPoint, p2: point, flipped:false)
        let intAngle = Int(floor(Double(floatAngle)))
        self.angle = 360 - intAngle
        let selectorCenterPoint = CGPoint(x: (selectorImageView?.center.x)!, y: (selectorImageView?.center.y)!)
        currentColor = getColorWithImage(image:colorsImage!, point: selectorCenterPoint)
        print("currentColor",currentColor)
        updatePositionForSelectorImage()
        
        // 这里可以通过block回调当前最新颜色值
    }
    
    
}
