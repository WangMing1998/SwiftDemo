//
//  WMPickerColorVC.swift
//  PartyLight
//
//  Created by Heaton on 2018/4/13.
//  Copyright © 2018年 WangMingDeveloper. All rights reserved.
//

import UIKit
import SnapKit
class WMPickerColorVC: UIViewController {
    

    
    
    
    var sliderSuperView:UIView? // 装载slider----高度 10%
    var colorPickerSuperView:UIView?// 装载colorPicker-- 高度--60%
    var buttonsSuperView:UIView?// 装载预设按钮 -- 高度-- 70%
    var pickerBackgroundImage:UIImageView?
    var colorPicker:WMColorPicker?// 拾色器
    var lightButton:UIButton?// 灯开关
    
    var alphaSlider:UISlider?
    var addImageView:UIImageView?
    var subImageView:UIImageView?
    var selectedImageView:UIImageView?
    var buttonsArray:Array<UIButton>?
    var buttonsBackgroundImage:UIImageView?
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonsArray = [UIButton]()
        setupForUI()
        
    }
    
    fileprivate func setupForUI(){
        
        // slider父视图
        sliderSuperView = UIView();
//        sliderSuperView?.backgroundColor = UIColor.red;
        view.addSubview(sliderSuperView!);
        
        // 拾色器父视图
        colorPickerSuperView = UIView()
//        colorPickerSuperView?.backgroundColor = UIColor.green
        view.addSubview(colorPickerSuperView!)
        
        // 预设颜色按钮组父视图
        buttonsSuperView = UIView()
//        buttonsSuperView?.backgroundColor = UIColor.blue
        view.addSubview(buttonsSuperView!)
        
        // 自定义slider
        alphaSlider = UISlider();
        alphaSlider?.minimumValue = alphaMinValue
        alphaSlider?.maximumValue = alphaMaxValue
        alphaSlider?.value = alphaCurrentValue
        alphaSlider?.setThumbImage(ImageWithName(name: alphaThubImageName), for: .normal)
        alphaSlider?.maximumTrackTintColor = UIColor.clear
        alphaSlider?.minimumTrackTintColor = UIColor.clear
        alphaSlider?.setMinimumTrackImage(ImageWithName(name: alphaMinTrackImageName).stretchableImage(withLeftCapWidth: 9, topCapHeight: 0), for:.normal)
        alphaSlider?.setMaximumTrackImage(ImageWithName(name: alphaMaxTrackImageName).stretchableImage(withLeftCapWidth: 9, topCapHeight: 0), for:.normal)
        sliderSuperView?.addSubview(alphaSlider!)
        
        // 加号
        addImageView = UIImageView.init(image: ImageWithName(name: addImageName))
        addImageView?.contentMode = UIViewContentMode.scaleAspectFill
        sliderSuperView?.addSubview(addImageView!)
        
        // 减号
        subImageView = UIImageView.init(image: ImageWithName(name: subImageName))
        subImageView?.contentMode = UIViewContentMode.scaleAspectFill
        sliderSuperView?.addSubview(subImageView!)
        
        // 取色器背景视图
        pickerBackgroundImage = UIImageView.init(image: ImageWithName(name: pickerBackgroundImageName))
        pickerBackgroundImage?.contentMode = .scaleAspectFill
        pickerBackgroundImage?.isUserInteractionEnabled = true
        colorPickerSuperView?.addSubview(pickerBackgroundImage!)
        
        colorPicker = WMColorPicker()
        colorPicker?.addTarget(self, action:  #selector(colorChange(sender:)), for: .valueChanged)
        colorPickerSuperView?.addSubview(colorPicker!)
        
        lightButton = UIButton();
        lightButton?.setImage(ImageWithName(name: lightButtonOffImageName), for: .normal)
        lightButton?.setImage(ImageWithName(name: ligthButtonOnImageName), for: .selected)
        lightButton?.addTarget(self, action: #selector(lightButtonTapped(sender:)), for:.touchUpInside)
        colorPickerSuperView?.addSubview(lightButton!)
        
        selectedImageView = UIImageView.init(image:ImageWithName(name:"color_picker_color_selected"))
        buttonsSuperView?.addSubview(selectedImageView!)
        
        let buttonsBackgroundImage:UIImageView = UIImageView.init(image: ImageWithName(name: "color_picker_common"))
        buttonsBackgroundImage.frame = CGRect(x: 0, y: 0, width:(buttonsSuperView?.width)!, height: (buttonsSuperView?.height)!)
        buttonsSuperView?.addSubview(buttonsBackgroundImage)
        
        
        var colorsButton:Array = [UIColor.red,UIColor.green,UIColor.blue,UIColor.yellow,UIColor.purple,UIColor.white]
        let space:CGFloat = 20.0;
        let buttonWidth:CGFloat = (view.width - CGFloat((colorsButton.count+1)) * space)/CGFloat(colorsButton.count)
        for i in 0..<6 {
            let button = UIButton();
            button.tag = i;
            button.backgroundColor = colorsButton[i]
            button.width = buttonWidth
            button.layer.cornerRadius = buttonWidth/2.0
            button.clipsToBounds = true
            buttonsSuperView?.addSubview(button)
            buttonsArray?.append(button)
            if i == 0{
                button.frame = CGRect(x: space * CGFloat((i+1)), y: 0, width: buttonWidth, height: buttonWidth)
            }else{
                 button.frame = CGRect(x: space * CGFloat((i+1))+buttonWidth * CGFloat(i), y: 0, width: buttonWidth, height: buttonWidth)
            }
        }
        
       

    }

    
    fileprivate func adjustForUI(){
        sliderSuperView?.snp.makeConstraints { (make) in
            make.left.right.top.equalTo(view)
            make.height.equalTo(view.snp.height).multipliedBy(0.15)
        }
        
        addImageView?.snp.makeConstraints({ (make) in
            make.width.height.equalTo(view.snp.width).multipliedBy(realWidth(width: 81.0))
            make.right.equalTo((alphaSlider?.snp.left)!)
            make.bottom.equalTo(sliderSuperView!);
        })
        
        subImageView?.snp.makeConstraints { (make) in
            make.width.height.equalTo(view.snp.width).multipliedBy(realWidth(width: 81.0))
            make.centerY.equalTo(addImageView!)
            make.left.equalTo((alphaSlider?.snp.right)!)
        }
        
        alphaSlider?.snp.makeConstraints({ (make) in
            make.centerX.equalTo(view)
            make.width.equalTo(view.snp.width).multipliedBy(realWidth(width: 550))
            make.height.equalTo((alphaSlider?.snp.width)!).multipliedBy(44.0/550.0)
            make.centerY.equalTo((addImageView?.snp.centerY)!)
        })
        
        
        
        colorPickerSuperView?.snp.makeConstraints { (make) in
            make.left.right.equalTo(view);
            make.top.equalTo((sliderSuperView?.snp.bottom)!)
            make.height.equalTo(view.snp.height).multipliedBy(0.65)
        }
        
        pickerBackgroundImage?.snp.makeConstraints({ (make) in
            make.width.height.equalTo(view.snp.width).multipliedBy(realWidth(width:743.0))
            make.center.equalTo(colorPickerSuperView!)
        })
       
        colorPicker?.snp.makeConstraints({ (make) in
            make.width.height.equalTo(view.snp.width).multipliedBy(realWidth(width:743.0))
            make.center.equalTo(colorPickerSuperView!)
        })
        
        lightButton?.snp.makeConstraints({ (make) in
            make.height.width.equalTo(view.snp.width).multipliedBy(realWidth(width: 315))
            make.center.equalTo(colorPickerSuperView!)
        })
        

        buttonsSuperView?.snp.makeConstraints({ (make) in
            make.left.right.equalTo(view)
            make.top.equalTo((colorPickerSuperView?.snp.bottom)!)
            make.bottom.equalTo(view.snp.bottom)
        })
        
        buttonsBackgroundImage?.snp.makeConstraints({ (make) in
            make.edges.equalTo(buttonsSuperView!)
        })
        
        
      
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        adjustForUI()

 
  
    }
    
    @objc func colorChange(sender:WMColorPicker){
        view.backgroundColor = sender.currentColor
    }
    
    
    @objc func lightButtonTapped(sender:UIButton){
        lightButton?.isSelected = !sender.isSelected
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
