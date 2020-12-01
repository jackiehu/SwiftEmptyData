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

    lazy var customView: UIView = {
        let v = UIView()
        v.backgroundColor = .white
        return v
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tableView = UITableView.snpTableView(supView: view, delegate: self, dataSource: self) { (make) in
            make.edges.equalToSuperview()
        }
        
        tableView.registerCell(JHTableViewCell.self)

 
        tableView.emptyView = EmptyView.empty(firstReloadHidden: false,
                                              canTouch: true,
                                              offsetY: -100,
                                              space: 0,
                                              backColor: .orange,
                                              deploy: { (config) in
                                                config.image = UIImage.init(named: "placeholder_tumblr")
                                                config.titleTopSpace = 50
                                                config.title = "sdfasd"
                                                config.detailTopSpace = 40
                                                config.detail = "asdasd"
                                                config.buttonTopSpace = 60
                                                config.buttonTitle = "asdasdasd"
                                                config.buttonColor = .red
                                                config.buttonSize = .init(width: 200, height: 50)
                                                config.eventTag = 2
                                                config.customView = self.customView
                                                config.customViewSize = .init(width: 100, height: 80)
                                              },
                                              closure: { (tag) in
                                                print("点击了tag--\(tag)")
                                              })
        
        
        DispatchQueue.main.asyncAfter(deadline: .now()+112) {
            self.mainArray = ["","","","","",""]
            tableView.reloadData()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now()+115) {
            self.mainArray.removeAll()
            tableView.reloadData()
            tableView.emptyView?.reloadEmpty(deploy: { (config) in
                config.title = "123123123"
            })
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now()+117) {
            self.mainArray.removeAll()
            tableView.reloadData()
            tableView.emptyView?.reloadEmpty(deploy: { (config) in
                config.title = "XXXXXXXXX"
                config.buttonTitle = "XXXXXXXXX"
                config.buttonColor = .red
                config.buttonSize = .init(width: 100, height: 50)
                config.eventTag = 6
            })
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(JHTableViewCell.self)
        cell.backgroundColor = UIColor.random
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    deinit{
        print("释放")
    }
}
