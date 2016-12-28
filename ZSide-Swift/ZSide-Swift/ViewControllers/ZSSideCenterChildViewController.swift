//
//  ZSSideCenterChildViewController.swift
//  ZSide-Swift
//
//  Created by dazhongge on 2016/12/26.
//  Copyright © 2016年 dazhongge. All rights reserved.
//

import UIKit

class ZSSideCenterChildViewController: ZSBaseViewController {

}












class ZSChildViewController1 : ZSBaseViewController {

    override func loadViews() {
        
        super.loadViews()
        
        let textLabel = UILabel(frame: .zero)
        textLabel.font = UIFont.systemFont(ofSize: 17)
        textLabel.textColor = .black
        textLabel.textAlignment = .center
        textLabel.text = "child1"
        view.addSubview(textLabel)
        
        textLabel.frame = CGRect.init(x: 30, y: 100, width: self.view.bounds.size.width - 60, height: 40)
        self.view.backgroundColor = .cyan
        
        let left = UIButton(type: .custom)
        left.setTitle("显示", for: .normal)
        left.setTitleColor(.black, for: .normal)
        left.addTarget(self, action: Selector(("leftAction:")), for: .touchUpInside)
        left.frame = CGRect.init(x: 30, y: 80, width: 50, height: 30)
        self.view.addSubview(left)
        
        
    }
    
    @objc private func leftAction(sender: UIButton) {
    
        print("dddddddd");
    
    }

}


class ZSChildViewController2 : ZSBaseViewController {
    
    override func loadViews() {
        
        super.loadViews()
        
        let textLabel = UILabel(frame: .zero)
        textLabel.font = UIFont.systemFont(ofSize: 17)
        textLabel.textColor = .black
        textLabel.textAlignment = .center
        textLabel.text = "child2"
        view.addSubview(textLabel)
        
        textLabel.frame = CGRect.init(x: 30, y: 100, width: self.view.bounds.size.width - 60, height: 40)
        self.view.backgroundColor = .cyan
        
        let left = UIButton(type: .custom)
        left.setTitle("显示", for: .normal)
        left.setTitleColor(.black, for: .normal)
        left.addTarget(self, action: Selector(("leftAction:")), for: .touchUpInside)
        left.frame = CGRect.init(x: 30, y: 80, width: 50, height: 30)
        self.view.addSubview(left)
        
        
    }
    
    @objc private func leftAction(sender: UIButton) {
        
        print("dddddddd");
        
    }
    
}


class ZSChildViewController3 : ZSBaseViewController {
    
    override func loadViews() {
        
        super.loadViews()
        
        let textLabel = UILabel(frame: .zero)
        textLabel.font = UIFont.systemFont(ofSize: 17)
        textLabel.textColor = .black
        textLabel.textAlignment = .center
        textLabel.text = "child3"
        view.addSubview(textLabel)
        
        textLabel.frame = CGRect.init(x: 30, y: 100, width: self.view.bounds.size.width - 60, height: 40)
        self.view.backgroundColor = .cyan
        
        let left = UIButton(type: .custom)
        left.setTitle("显示", for: .normal)
        left.setTitleColor(.black, for: .normal)
        left.addTarget(self, action: Selector(("leftAction:")), for: .touchUpInside)
        left.frame = CGRect.init(x: 30, y: 80, width: 50, height: 30)
        self.view.addSubview(left)
        
        
    }
    
    @objc private func leftAction(sender: UIButton) {
        
        print("dddddddd");
        
    }
    
}



class ZSChildViewController4 : ZSBaseViewController {
    
    override func loadViews() {
        
        super.loadViews()
        
        let textLabel = UILabel(frame: .zero)
        textLabel.font = UIFont.systemFont(ofSize: 17)
        textLabel.textColor = .black
        textLabel.textAlignment = .center
        textLabel.text = "child4"
        view.addSubview(textLabel)
        
        textLabel.frame = CGRect.init(x: 30, y: 100, width: self.view.bounds.size.width - 60, height: 40)
        self.view.backgroundColor = .cyan
        
        let left = UIButton(type: .custom)
        left.setTitle("显示", for: .normal)
        left.setTitleColor(.black, for: .normal)
        left.addTarget(self, action: Selector(("leftAction:")), for: .touchUpInside)
        left.frame = CGRect.init(x: 30, y: 80, width: 50, height: 30)
        self.view.addSubview(left)
        
        
    }
    
    @objc private func leftAction(sender: UIButton) {
        
        print("dddddddd");
        
    }
    
}



class ZSChildViewController5 : ZSBaseViewController {
    
    override func loadViews() {
        
        super.loadViews()
        
        let textLabel = UILabel(frame: .zero)
        textLabel.font = UIFont.systemFont(ofSize: 17)
        textLabel.textColor = .black
        textLabel.textAlignment = .center
        textLabel.text = "child5"
        view.addSubview(textLabel)
        
        textLabel.frame = CGRect.init(x: 30, y: 100, width: self.view.bounds.size.width - 60, height: 40)
        self.view.backgroundColor = .cyan
        
        let left = UIButton(type: .custom)
        left.setTitle("显示", for: .normal)
        left.setTitleColor(.black, for: .normal)
        left.addTarget(self, action: Selector(("leftAction:")), for: .touchUpInside)
        left.frame = CGRect.init(x: 30, y: 80, width: 50, height: 30)
        self.view.addSubview(left)
        
        
    }
    
    @objc private func leftAction(sender: UIButton) {
        
        print("dddddddd");
        
    }
    
}


