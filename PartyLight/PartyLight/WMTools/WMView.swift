//
//  WMView.swift
//  PartyLight
//
//  Created by Heaton on 2018/4/13.
//  Copyright © 2018年 WangMingDeveloper. All rights reserved.
//

import Foundation
extension UIView {
    public var x: CGFloat{
        get{
            return self.frame.origin.x
        }
        set{
            var r = self.frame
            r.origin.x = newValue
            self.frame = r
        }
    }
    
    public var y: CGFloat{
        get{
            return self.frame.origin.y
        }
        set{
            var r = self.frame
            r.origin.y = newValue
            self.frame = r
        }
    }
    
    public var width:CGFloat{
        get{
            return self.frame.size.width
        }
        set{
            var frame = self.frame
            frame.size.width  = newValue
            self.frame = frame
        }
    }
    
    public var height:CGFloat{
        get{
            return self.frame.size.height
        }
        set{
            var frame = self.frame
            frame.size.height  = newValue
            self.frame = frame
        }
    }
    
    public var centerX:CGFloat{
        get{
            return self.center.x
        }
        set{
            var centerPoint = self.center
            centerPoint.x  = newValue
            self.center = centerPoint
        }
    }
    
    public var centerY:CGFloat{
        get{
            return self.center.y
        }
        set{
            var centerPoint = self.center
            centerPoint.y  = newValue
            self.center = centerPoint
        }
    }
}
