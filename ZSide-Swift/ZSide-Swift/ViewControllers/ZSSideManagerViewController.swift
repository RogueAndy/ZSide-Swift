//
//  ZSSideManagerViewController.swift
//  ZSide-Swift
//
//  Created by dazhongge on 2016/12/26.
//  Copyright © 2016年 dazhongge. All rights reserved.
//

import UIKit
import Foundation

class ZSSideManagerViewController: ZSBaseViewController {
    
    class var manager: ZSSideManagerViewController {
        
        struct Static {
        
            static let instance: ZSSideManagerViewController = ZSSideManagerViewController()
        
        }
       
        return Static.instance
    
    }
    
    private var leftController: UIViewController!
    private var centerController: UIViewController!
    private var leftView: UIView!
    private var centerView: UIView!
    private let panGesture = UIPanGestureRecognizer()
    private let lasttimePoint = CGFloat()
    private var viewControllers: Array<UIViewController>!
    
    let isCenterViewControllerMoveAlongWithLeft: Bool! = nil
    
    class func initWithLeftController(leftController: UIViewController, centerControllers: Array<UIViewController>, moveDistance: CGFloat) -> ZSSideManagerViewController {
    
        let side = self.shareInstance()
        side.leftController = leftController
        side.viewControllers = centerControllers
        
        return side;
    
    }
    
    class func initWithLeftController(leftController: UIViewController, centerController: Array<UIViewController>) -> ZSSideManagerViewController {
    
        let side = self.shareInstance()
        return side;
    
    }
    
    class func showLeftView() {
    
        
    
    }
    
    class func hideLeftView() {
    
        
    
    }
    
    class func selectViewControllerOfIndex(index: NSInteger) {
    
        
    
    }
    
    private class func shareInstance() -> ZSSideManagerViewController {
    
        return manager
    
    }

}
