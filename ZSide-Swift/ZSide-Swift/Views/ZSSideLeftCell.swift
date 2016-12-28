//
//  ZSideLeftCell.swift
//  ZSide-Swift
//
//  Created by dazhongge on 2016/12/28.
//  Copyright © 2016年 dazhongge. All rights reserved.
//

import UIKit

class ZSSideLeftCell: ZSBaseTableViewCell {
    
    private(set) var actionLabel: UILabel!
    
    override func loadViews() {
        
        super.loadViews()
        
        self.backgroundColor = .clear
        self.actionLabel = UILabel(frame: .zero)
        self.actionLabel.font = UIFont.systemFont(ofSize: 15)
        self.actionLabel.textColor = .black
        self.contentView.addSubview(self.actionLabel)
        
    }
    
    override func loadLayout() {
        
        super.loadLayout()
        
        self.actionLabel.frame = CGRect.init(x: 20, y: 5, width: 150, height: 30)
        
    }
    
    override func draw(_ rect: CGRect) {
        
        super.draw(rect)
        
        let color = UIColor.init(colorLiteralRed: 180, green: 200, blue: 200, alpha: 1)
        color.set()
        
        let path = UIBezierPath()
        path.move(to: CGPoint.init(x: 0, y: 41))
        path.addLine(to: CGPoint.init(x: 300, y: 41))
        path.stroke()
        
    }
    
}
