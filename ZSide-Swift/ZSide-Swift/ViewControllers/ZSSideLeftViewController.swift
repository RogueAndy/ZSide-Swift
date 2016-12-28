//
//  ZSSideLeftViewController.swift
//  ZSide-Swift
//
//  Created by dazhongge on 2016/12/26.
//  Copyright © 2016年 dazhongge. All rights reserved.
//

import UIKit

class ZSSideLeftViewController: ZSBaseViewController, UITableViewDelegate, UITableViewDataSource {

    private var buttonTable: UITableView!
    private let buttonNames = ["第一个", "第二个", "第三个", "第四个", "第五个"]
    
    override func loadInit() {
        
        super.loadInit()
        self.view.backgroundColor = UIColor.init(patternImage: UIImage(named: "leftimg")!)
        
    }
    
    override func loadViews() {
        
        super.loadViews()
        
        buttonTable = UITableView(frame: .zero)
        buttonTable.delegate = self
        buttonTable.dataSource = self
        buttonTable.backgroundColor = .clear
        let clearView = UIView()
        clearView.backgroundColor = .clear
        buttonTable.tableFooterView = clearView
        
        self.view.addSubview(buttonTable)
        
    }
    
    override func loadLayout() {
        
        super.loadLayout()
        
        buttonTable.frame = CGRect.init(x: 0, y: 200, width: 300, height: 200)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return buttonNames.count
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 42
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        ZSSideManagerViewController.selectViewControllerOfIndex(index: indexPath.row)
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identifier = "ZSSideLeftCell"
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? ZSSideLeftCell
        if cell == nil {
        
            cell = ZSSideLeftCell(style: .default, reuseIdentifier: identifier)
        
        }
        
        cell!.actionLabel.text = buttonNames[indexPath.row]
        return cell!
        
    }

    

}
