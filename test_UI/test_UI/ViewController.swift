//
//  ViewController.swift
//  test_UI
//
//  Created by 9S on 2019/2/13.
//  Copyright © 2019 9S. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()

        simpleView1()
        leftTopView()
        rightTopView()
    }
    
    func simpleView1() {
        let containerView1 = UIView()
        containerView1.backgroundColor = UIColor.yellow
        containerView1.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(containerView1)
        
        
        let centerHorizontally =
                               // 要設定的元件
            NSLayoutConstraint(item: containerView1,
                               // 約束類型 （centerX為x軸致置中)
                               attribute: .centerX,
                               // attribute設定與其他視圖attribute的關係 可讓第一個參數<>=下個參數值
                               relatedBy: .equal,
                               // 參考視圖 目前以view本身來當參考
                               toItem: self.view,
                               // attribute參數(第二個)是參考視圖(在這裡為self.view)的constraint type
                               attribute: .centerX,
                               // multiplier參數將第二個attribute參數的值乘以另一個做為參數給定的值 預設1.0
                               multiplier: 1.0,
                               // 偏離 會加入attribute裡面計算
                               constant: 0.0)
        
        let centerVertically =
            NSLayoutConstraint(item: containerView1,
                               attribute: .centerY,
                               relatedBy: .equal,
                               toItem: self.view,
                               attribute: .centerY,
                               multiplier: 1.0,
                               constant: 0.0)
        // width
        NSLayoutConstraint(item: containerView1,
                           attribute: .width,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .notAnAttribute,
                           multiplier: 1.0,
                           constant: 50.0).isActive = true
        // height
        NSLayoutConstraint(item: containerView1,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .notAnAttribute,
                           multiplier: 1.0,
                           constant: 50.0).isActive = true
        NSLayoutConstraint.activate([centerHorizontally, centerVertically])
        
        
        let containerView2 = UIView()
        containerView2.backgroundColor = UIColor.black
        containerView2.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(containerView2)
        
        NSLayoutConstraint(item: containerView2, attribute: .centerX,
                           relatedBy: .equal, toItem: self.view,
                           attribute: .centerX, multiplier: 1.0,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: containerView2, attribute: .top,
                           relatedBy: .equal, toItem: containerView1,
                           attribute: .bottom, multiplier: 1.0,
                           constant: 30.0).isActive = true
        NSLayoutConstraint(item: containerView2, attribute: .width,
                           relatedBy: .equal, toItem: containerView1,
                           attribute: .width, multiplier: 2.0,
                           constant: 0.0).isActive = true
        NSLayoutConstraint(item: containerView2, attribute: .height,
                           relatedBy: .equal, toItem: containerView1,
                           attribute: .height, multiplier: 2.0,
                           constant: 0.0).isActive = true
    }
    
    func leftTopView() {
        let leftViewHeight: CGFloat = 10
        let leftViewWidth: CGFloat = 20
        let leftView = UIView()
        let layoutguid = view.safeAreaLayoutGuide
        leftView.backgroundColor = UIColor.green
        leftView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(leftView)
        
        let centerHorizontally =
            NSLayoutConstraint(item: leftView,
                               attribute: .centerX,
                               relatedBy: .equal,
                               toItem: layoutguid,
                               attribute: .centerX,
                               multiplier: 1.0,
                               constant: -(leftViewWidth))
        
        let centerVertically =
            NSLayoutConstraint(item: leftView,
                               attribute: .top,
                               relatedBy: .equal,
                               toItem: layoutguid,
                               attribute: .top,
                               multiplier: 1.0,
                               constant: 10.0)
        NSLayoutConstraint(item: leftView,
                           attribute: .width,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .notAnAttribute,
                           multiplier: 1.0,
                           constant: leftViewWidth).isActive = true
        NSLayoutConstraint(item: leftView,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .notAnAttribute,
                           multiplier: 1.0,
                           constant: leftViewHeight).isActive = true
        
        NSLayoutConstraint.activate([centerHorizontally, centerVertically])
    }
    
    func rightTopView() {
        let rightViewHeight: CGFloat = 10
        let rightViewWidth: CGFloat = 20
        let rightView = UIView()
        let layoutguid = view.safeAreaLayoutGuide
        rightView.backgroundColor = UIColor.red
        rightView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(rightView)
        
        let centerHorizontally =
            NSLayoutConstraint(item: rightView,
                               attribute: .centerX,
                               relatedBy: .equal,
                               toItem: layoutguid,
                               attribute: .centerX,
                               multiplier: 1.0,
                               constant: rightViewWidth)
        
        let centerVertically =
            NSLayoutConstraint(item: rightView,
                               attribute: .top,
                               relatedBy: .equal,
                               toItem: layoutguid,
                               attribute: .top,
                               multiplier: 1.0,
                               constant: 10.0)
        NSLayoutConstraint(item: rightView,
                           attribute: .width,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .notAnAttribute,
                           multiplier: 1.0,
                           constant: rightViewWidth).isActive = true
        
        NSLayoutConstraint(item: rightView,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .notAnAttribute,
                           multiplier: 1.0,
                           constant: rightViewHeight).isActive = true
        NSLayoutConstraint.activate([centerHorizontally, centerVertically])
    }
    

}

