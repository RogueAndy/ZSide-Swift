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
        self.view.backgroundColor = UIColor.init(patternImage: UIImage(named: "show1")!)
        
        let left = UIButton(type: .custom)
        left.setTitle("显示", for: .normal)
        left.setTitleColor(.black, for: .normal)
        left.addTarget(self, action: #selector(leftAction), for: .touchUpInside)
        left.frame = CGRect.init(x: 30, y: 80, width: 50, height: 30)
        self.view.addSubview(left)
        
        
    }
    
    @objc private func leftAction(sender: UIButton) {
    
        ZSSideManagerViewController.showLeftView()
    
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
        self.view.backgroundColor = UIColor.init(patternImage: UIImage(named: "show2")!)
        
        let left = UIButton(type: .custom)
        left.setTitle("显示", for: .normal)
        left.setTitleColor(.black, for: .normal)
        left.addTarget(self, action: #selector(leftAction), for: .touchUpInside)
        left.frame = CGRect.init(x: 30, y: 80, width: 50, height: 30)
        self.view.addSubview(left)
        
        
    }
    
    @objc private func leftAction(sender: UIButton) {
        
        ZSSideManagerViewController.showLeftView()
        
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
        self.view.backgroundColor = UIColor.init(patternImage: UIImage(named: "show1")!)
        
        let left = UIButton(type: .custom)
        left.setTitle("显示", for: .normal)
        left.setTitleColor(.black, for: .normal)
        left.addTarget(self, action: #selector(leftAction), for: .touchUpInside)
        left.frame = CGRect.init(x: 30, y: 80, width: 50, height: 30)
        self.view.addSubview(left)
        
        
    }
    
    @objc private func leftAction(sender: UIButton) {
        
        ZSSideManagerViewController.showLeftView()
        
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
        self.view.backgroundColor = UIColor.init(patternImage: UIImage(named: "show2")!)
        
        let left = UIButton(type: .custom)
        left.setTitle("显示", for: .normal)
        left.setTitleColor(.black, for: .normal)
        left.addTarget(self, action: #selector(leftAction), for: .touchUpInside)
        left.frame = CGRect.init(x: 30, y: 80, width: 50, height: 30)
        self.view.addSubview(left)
        
        
    }
    
    @objc private func leftAction(sender: UIButton) {
        
        ZSSideManagerViewController.showLeftView()
        
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
        self.view.backgroundColor = UIColor.init(patternImage: UIImage(named: "show1")!)
        
        let left = UIButton(type: .custom)
        left.setTitle("显示", for: .normal)
        left.setTitleColor(.black, for: .normal)
        left.addTarget(self, action: #selector(leftAction), for: .touchUpInside)
        left.frame = CGRect.init(x: 30, y: 80, width: 50, height: 30)
        self.view.addSubview(left)
        
        let click = UIButton(type: .custom)
        click.setTitle("点击测试", for: .normal)
        click.setTitleColor(.black, for: .normal)
        click.addTarget(self, action: #selector(buttonclick), for: .touchUpInside)
        click.frame = CGRect.init(x: 30, y: 200, width: 80, height: 30)
        self.view.addSubview(click)
        
        
    }
    
    @objc private func leftAction(sender: UIButton) {
        
        ZSSideManagerViewController.showLeftView()
        
    }
    
    @objc private func buttonclick(sender: UIButton) {
        print("alertalertalert")
        let alert = UIAlertController.init(title: "测试点击效果", message: "测试点击效果", preferredStyle: .alert)
        let action = UIAlertAction(title: "好的", style: .cancel) { (handle) in
            
        }
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
        
    }
    
}


