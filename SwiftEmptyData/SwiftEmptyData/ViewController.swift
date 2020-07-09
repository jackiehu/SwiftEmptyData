//
//  ViewController.swift
//  SwiftEmptyData
//
//  Created by jackiehu on 07/08/2020.
//  Copyright (c) 2020 jackiehu. All rights reserved.
//

import UIKit 
import SwiftBrick
class ViewController: JHViewController ,UITableViewDelegate,UITableViewDataSource{
    
    var mainArray = [String]()
//    var mainArray = ["示例UIView1","示例UIView2","示例UIView3-可点击","示例UIImageView-可点击","示例UIImageView","示例Button"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.title = "示例UITableView"

        let tableView = UITableView.snpTableView(supView: view, delegate: self, dataSource: self) { (make) in
            make.edges.equalToSuperview()
        }
        
        tableView.registerCell(JHTableViewCell.self)
//         self.tabBarController?.tabBar.badgePoint = CGPoint(x: 25, y: -3)
        self.tabBarController?.tabBar.badgeSize = CGSize(width: 20, height: 20)
//        self.tabBarController?.tabBar.badgeColor = UIColor.red
//        self.tabBarController?.tabBar.badgeImage = UIImage(named: "share_haoyou_btn")
        self.tabBarController?.tabBar.badgeValue = 200
        self.tabBarController?.tabBar.showBadgeOnItemIndex(index: 0)
 
        tableView.emptyView = EmptyView.empty({ (config) in
            config.emptyViewCanTouch = true
            config.offsetY = -100
            config.image = UIImage.init(named: "placeholder_tumblr")
            config.title = "sdfasd"
            config.detail = "asdasd"
            config.buttonTitle = "asdasdasd"
            config.buttonColor = .orange
            config.buttonSize = .init(width: 200, height: 50)
        }) {
            print("点击")
        }
        
    }
 
    // MARK:-示例快速创建UIView 使用部分默认参数 --初始化使用SnapKit
    func demoView1(supView: UIView){
        
        UIView.snpView(supView: supView, backColor: .purple) { (make) in
            make.top.equalTo(supView).offset(10)
            make.centerX.equalTo(supView)
            make.width.equalTo(80)
            make.height.equalTo(40)
        }
        
    }
    // MARK:-示例快速创建UIView 使用部分默认参数--初始化不使用SnapKit
    func demoView2(supView: UIView){
        let vi = UIView.snpView(backColor: .cyan)
        supView.addSubview(vi)
        vi.snp.makeConstraints { (make) in
            make.top.equalTo(supView).offset(10)
            make.centerX.equalTo(supView)
            make.width.equalTo(80)
            make.height.equalTo(40)
        }
        
    }
    // MARK:-示例快速创建UIView 使用全部参数--有单击操作
    func demoView3(supView: UIView){
        UIView.snpView(supView: supView, backColor: .purple, tapGesture: { (view) in
            print("1111")
        }) { (make) in
            make.top.equalTo(supView).offset(20)
            make.centerX.equalTo(supView)
            make.width.equalTo(80)
            make.height.equalTo(40)
        }
    }
    // MARK:-示例快速创建UIimageView
    func demoImageView1(supView: UIView){
        
        UIImageView.snpImageView(supView: supView, backColor: .purple) { (make) in
            make.top.equalTo(supView).offset(30)
            make.centerX.equalTo(supView)
            make.width.equalTo(80)
            make.height.equalTo(40)
        }

    }
    
    func demoImageView2(supView: UIView){
        UIImageView.snpImageView(supView: supView, backColor: .orange, image: UIImage.init(named: "share_haoyou_btn"), snpTapGesture: { (view) in
            print("点击图片")
            self.tabBarController?.tabBar.hiddenRedPointOnIndex(index: 0, animation: true)
        }) { (make) in
            make.top.equalTo(supView).offset(30)
            make.centerX.equalTo(supView)
            make.width.equalTo(80)
            make.height.equalTo(40)
        }

    }
    // MARK:-示例快速创建按钮
    func demoButton(supView: UIView){
        let btn = UIButton.snpButton(supView: supView, backColor: .orange, title: "button", touchUp: { (btn) in
            print("点击Button")
        }) { (make) in
            make.top.equalTo(supView).offset(40)
            make.centerX.equalTo(supView)
        }

        btn.setImage(UIImage.init(named: "share_haoyou_btn"), for: .normal)
        btn.layoutButton(.imagePositionRight, space: 10)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(JHTableViewCell.self)
        for view in cell.contentView.subviews {
            view.removeFromSuperview()
        }
        cell.textLabel?.text = mainArray[indexPath.row]
        switch indexPath.row {
        case 0:
            self.demoView1(supView: cell.contentView)
        case 1:
            self.demoView2(supView: cell.contentView)
        case 2:
            self.demoView3(supView: cell.contentView)
        case 3:
            self.demoImageView1(supView: cell.contentView)
        case 4:
            self.demoImageView2(supView: cell.contentView)
        case 5:
            self.demoButton(supView: cell.contentView)
            
        default:
            print("")
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    deinit{
        print("释放")
    }
}
