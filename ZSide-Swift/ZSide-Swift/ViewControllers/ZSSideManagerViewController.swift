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
    
    // MARK: - private attribution
    
    private var leftController: UIViewController!
    private var centerController: UIViewController!
    private var leftView: UIView!
    private var centerView: UIView!
    private var lasttimePoint: CGPoint!
    private var maxMoveDistance: CGFloat = 300.0
    private var panGesture: UIPanGestureRecognizer!
    private var preventView: UIView?
    /**
     private lazy var preventView: UIView? = {
     
     let prevent = UIView(frame: self.view.bounds)
     
     self.centerView.addSubview(prevent)
     let tap = UITapGestureRecognizer.init(target: self, action: #selector(tapPreventView))
     prevent.isUserInteractionEnabled = true
     prevent.addGestureRecognizer(tap)
     
     print("----- 判断是否进行了新增的界面")
     return prevent
     
     }()
     */
    
    private var viewControllers: Array<UIViewController> = [] {
    
        willSet(centerControllers) {
        
            self.viewControllers = centerControllers
            for viewController: UIViewController in viewControllers {
            
                self.addChildViewController(viewController)
            
            }
        
        }
        
    }
    
    // MARK: - public attribution
    
   public var isCenterViewControllerMoveAlongWithLeft: Bool = false
    
    // MARK: - class method, use for public or init
    
    class func initWithLeftController(leftController: UIViewController, centerControllers: Array<UIViewController>, moveDistance: CGFloat) -> ZSSideManagerViewController {
    
        let side = self.shareInstance()
        side.leftController = leftController
        side.viewControllers = centerControllers
        side.maxMoveDistance = moveDistance

        return side;
    
    }
    
    class func initWithLeftController(leftController: UIViewController, centerControllers: Array<UIViewController>) -> ZSSideManagerViewController {
    
        let side = self.shareInstance()
        side.leftController = leftController
        side.viewControllers = centerControllers
        return side;
    
    }
    
    class func showLeftView() {
    
        manager.showLeftView()
    
    }
    
    class func hideLeftView() {
    
        manager.hideLeftView()
    
    }
    
    class func selectViewControllerOfIndex(index: NSInteger) {
    
        manager.switchToViewController(index: index)
    
    }
    
    // MARK: - class private method, use for private
    
    private class func shareInstance() -> ZSSideManagerViewController {
    
        return manager
    
    }
    
    // MARK: - class dynamic method
    
    override func loadInit() {
        
        super.loadInit()
        
        self.centerController = self.viewControllers.first
        self.leftView = self.leftController.view
        self.centerView = self.centerController.view
        self.leftView.frame = self.leftViewBaseRect()
        self.centerView.frame = self.centerViewBaseRect()
        
        self.panGesture = UIPanGestureRecognizer.init(target: self, action: #selector(vvGestureAction))
        self.view.addGestureRecognizer(self.panGesture)
        
    }
    
    override func loadLayout() {
        
        super.loadLayout()
        
        self.view.addSubview(self.centerView)
        self.view.addSubview(self.leftView)
        
    }
    
    // MARK: - dynamic method in static method
    
    private func showLeftView() {
    
        UIView.animate(withDuration: 0.25, animations: { 
            
            self.setLeftViewOverRect()
            if self.isCenterViewControllerMoveAlongWithLeft == true {
            
                self.setCenterViewOverRect()
            
            }
            
        }) { (finished) in
            
            self.setPreventViewAppear()
            
        }
    
    }
    
    private func hideLeftView() {
    
        UIView.animate(withDuration: 0.25, animations: { 
            
            self.setLeftViewBaseRect()
            if self.isCenterViewControllerMoveAlongWithLeft == true {
            
                self.setCenterViewBaseRect()
            
            }
            
        }) { (finished) in
            
            self.setPreventViewDisAppear()
            
        }
    
    }
    
    // MARK: - set LeftViewController and CenterViewController's base frame
    
    private func leftViewBaseRect() -> CGRect {
        
        return CGRect.init(x: -self.maxMoveDistance, y: 0, width: self.maxMoveDistance, height: UIScreen.main.bounds.size.height)
    
    }
    
    private func leftViewOverRect() -> CGRect {
    
        return CGRect.init(x: 0, y: 0, width: self.maxMoveDistance, height: UIScreen.main.bounds.size.height)
    
    }
    
    private func centerViewBaseRect() -> CGRect {
    
        return self.view.bounds
    
    }
    
    private func centerViewOverRect() -> CGRect {
    
        return CGRect.init(x: self.maxMoveDistance, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
    
    }
    
    // MARK: - set leftView and centerView's frame
    
    private func setLeftViewBaseRect() {
    
        self.leftView.frame = self.leftViewBaseRect()
    
    }
    
    private func setLeftViewOverRect() {
    
        self.leftView.frame = self.leftViewOverRect()
    
    }
    
    private func setCenterViewBaseRect() {
    
        self.centerView.frame = self.centerViewBaseRect()
    
    }
    
    private func setCenterViewOverRect() {
    
        self.centerView.frame = self.centerViewOverRect()
    
    }
    
    private func setPreventViewAppear() {
    
        self.getProventView()
        self.preventView?.alpha = 1
    
    }
    
    private func setPreventViewDisAppear() {
    
        self.preventView?.alpha = 0
        self.preventView?.removeFromSuperview()
        self.preventView = nil
        
        /**
         无法进行以下代码， swift的懒加载和oc的懒加载有区别，oc的懒加载，可以 nil 后重新初始化，但是swift的懒加载只能执行一次
         self.preventView!.removeFromSuperview()
         self.preventView = nil
         */
    
    }
    
    
    // MARK: - Selector Method
    
    @objc private func vvGestureAction(gesture: UIPanGestureRecognizer) {
    
        let panPoint = gesture.translation(in: self.view)
        
        switch gesture.state {
        case .began:
            self.lasttimePoint = panPoint
            
        case .changed:
            self.moveWithUserPangesture(distance: self.makeDirectionWithNowPoint(nowPoint: panPoint, beforePoint: self.lasttimePoint))
            
        case .ended:
            self.stopDragAndViewGoBack()
            
        default:
            print("select default switch")
        }
    
    }
    
    // MARK: - PanGesture and TapGesture Method
    
    @objc private func tapPreventView(sender: UITapGestureRecognizer) {
    
        self.hideLeftView()
        
    }
    
    private func moveWithUserPangesture(distance: CGFloat) {
    
        self.leftViewRectAfterMove(distance: distance)
        self.centerViewRectAfterMove(distance: distance)
    
    }
    
    // MARK: - se this Method when view is moving
    
    private func leftViewRectAfterMove(distance: CGFloat) {
    
        if self.leftView.frame.origin.x + distance <= -self.maxMoveDistance {
        
            self.leftView.frame = self.leftViewBaseRect()
            return
        
        }
        
        if self.leftView.frame.origin.x + distance >= 0 {
        
            self.leftView.frame = self.leftViewOverRect()
            return
        
        }
        
        self.leftView.frame = CGRect.init(x: self.leftView.frame.origin.x + distance, y: self.leftView.frame.origin.y, width: self.leftView.frame.size.width, height: self.leftView.frame.size.height)
        
    }
    
    private func centerViewRectAfterMove(distance: CGFloat) {
    
        if self.isCenterViewControllerMoveAlongWithLeft == false {
        
            return
        
        }
        
        if self.centerView.frame.origin.x + distance <= 0 {
        
            self.centerView.frame = self.centerViewBaseRect()
            return
        
        }
        
        if self.centerView.frame.origin.x + distance >= self.maxMoveDistance {
        
            self.centerView.frame = self.centerViewOverRect()
            return
        
        }
        
        self.centerView.frame = CGRect.init(x: self.centerView.frame.origin.x + distance, y: self.centerView.frame.origin.y, width: self.centerView.frame.size.width, height: self.centerView.frame.size.height)
    
    }
    
    // MARK: - when user stop the drag, the view need go back and stop
    
    private func stopDragAndViewGoBack() {
    
        let leftViewOriginX = self.leftView.frame.origin.x
        if leftViewOriginX < -self.maxMoveDistance / 2.0 {
        
            if self.isCenterViewControllerMoveAlongWithLeft == true {
            
                UIView.animate(withDuration: 0.25, animations: { 
                    
                    self.setLeftViewBaseRect()
                    self.setCenterViewBaseRect()
                    
                }, completion: { (finished) in
                    
                    self.setPreventViewDisAppear()
                    
                })
                
                return
                
            }
            
            UIView.animate(withDuration: 0.25, animations: { 
                
                self.setLeftViewBaseRect()
                
            }, completion: { (finished) in
                
                self.setPreventViewDisAppear()
                
            })
            
            return
        
        }
        
        if self.isCenterViewControllerMoveAlongWithLeft == true {
        
            UIView.animate(withDuration: 0.25, animations: { 
                
                self.setLeftViewOverRect()
                self.setCenterViewOverRect()
                
            }, completion: { (finished) in
                
                self.setPreventViewAppear()
                
            })
            
            return
        
        }
        
        UIView.animate(withDuration: 0.25, animations: { 
            
            self.setLeftViewOverRect()
            
        }) { (finished) in
            
            self.setPreventViewAppear()
            
        }
    
    }
    
    //MARK: - get the distance for the moving
    
    private func makeDirectionWithNowPoint(nowPoint: CGPoint, beforePoint: CGPoint) -> CGFloat {
    
        let distance = nowPoint.x - beforePoint.x
        self.lasttimePoint = nowPoint
        
        return distance
    
    }
    
    //MARK: - click left menus and switch to viewController
    
    private func switchToViewController(index: Int) {
    
        let selectViewController = self.childViewControllers[index]
        if selectViewController == self.centerController {
        
            self.hideLeftView()
            return
        
        }
        
        self.centerView = selectViewController.view
        self.setCenterViewOverRect()
        self.transition(from: self.centerController, to: selectViewController, duration: 0, options: UIViewAnimationOptions.allowAnimatedContent, animations: {
            
        }) { (finished) in
            
            self.centerController = selectViewController
            self.hideLeftView()
            
        }
        
    
    }
    
    //MARK: - init preventView
    
    private func getProventView() {
    
        if self.preventView == nil {
        
            self.preventView = UIView(frame: self.view.bounds)
            
            self.centerView.addSubview(self.preventView!)
            let tap = UITapGestureRecognizer.init(target: self, action: #selector(tapPreventView))
            self.preventView!.isUserInteractionEnabled = true
            self.preventView!.addGestureRecognizer(tap)
        
        }
        
    }

}
