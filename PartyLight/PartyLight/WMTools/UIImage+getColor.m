//
//  UIImage+getColor.m
//  PartyLight
//
//  Created by Heaton on 2018/4/13.
//  Copyright © 2018年 WangMingDeveloper. All rights reserved.
//

#import "UIImage+getColor.h"

@implementation UIImage (getColor)
+(UIColor *)getColorWithImage:(UIImage *)image point:(CGPoint)point{
    // 计算滑帽的中心点位置，取色
    NSInteger pointX = trunc(point.x);
    NSInteger pointY = trunc(point.y);
    CGImageRef cgImage = image.CGImage;
    NSUInteger width = image.size.width;
    NSUInteger height = image.size.height;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    int bytesPerPixel = 4;
    int bytesPerRow = bytesPerPixel * 1;
    NSUInteger bitsPerComponent = 8;
    unsigned char pixelData[4] = { 0, 0, 0, 0 };
    CGContextRef context = CGBitmapContextCreate(pixelData,
                                                 1,
                                                 1,
                                                 bitsPerComponent,
                                                 bytesPerRow,
                                                 colorSpace,
                                                 kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder32Big);
    CGColorSpaceRelease(colorSpace);
    CGContextSetBlendMode(context, kCGBlendModeCopy);
    
    //
    CGContextTranslateCTM(context, -pointX, pointY-(CGFloat)height);
    CGContextDrawImage(context, CGRectMake(0.0f, 0.0f, (CGFloat)width, (CGFloat)height), cgImage);
    CGContextRelease(context);
    
    UIColor *color = [UIColor colorWithRed:(CGFloat)pixelData[0] / 255.0f green:(CGFloat)pixelData[1] / 255.0f blue:(CGFloat)pixelData[2] / 255.0f alpha:1];
    
    return color;
}

@end
