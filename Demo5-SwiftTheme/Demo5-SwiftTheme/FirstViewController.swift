//
//  FirstViewController.swift
//  Demo5-SwiftTheme
//
//  Created by cuizongwei on 22/8/18.
//  Copyright © 2018年 cuizongwei. All rights reserved.
//

import UIKit
import SnapKit

let KscreenW = UIScreen.main.bounds.size.width
let KscreenH = UIScreen.main.bounds.size.height
class FirstViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    
    lazy var bigTitle:UILabel = {
        let title = UILabel()
        title.textAlignment = .center
        title.text = "我是大标题"
        title.theme_textColor = GlobalPicker.textColor
        return title
    }()
    lazy var table:UITableView = {
        let table = UITableView()
        table.delegate = self
        table.dataSource = self
        return table
    }()
    lazy var imageButton:UIImageView = {
        let image = UIImageView()
        return image
    }()
    lazy var changeButton:UIButton = {
        let button = UIButton()
        button.setTitle("我是按钮", for: .normal)
        button.theme_setTitleColor(GlobalPicker.textColor, forState: .normal)
        button.theme_backgroundColor = GlobalPicker.backgroundColor
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        _setUpUI()
        
        //注册cell的值
        table.register(UITableViewCell.self, forCellReuseIdentifier: "ceshi")
        
        changeButton.addTarget(self, action: #selector(changeTheme), for: .touchUpInside)

    }
    
    @objc private func changeTheme() {
        MyThemes.switchToNext()
    }
}
// MARK: 设置UItableView的数据源和代理
extension FirstViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ceshi")
        if indexPath.row == 0 {
            cell?.textLabel?.text = "点击选择主题颜色"
        } else {
            cell?.textLabel?.text = "点击变成夜间模式"
        }
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            present(ColorViewController(), animated: true, completion: {
                
            })
        }
    }
}
// MARK:设置UI界面
extension FirstViewController {
    private func _setUpUI() {
        view.theme_backgroundColor = GlobalPicker.backgroundColor
        
        view.addSubview(bigTitle)
        view.addSubview(table)
        view.addSubview(imageButton)
        view.addSubview(changeButton)
        
        bigTitle.snp.makeConstraints { (make) in
            make.width.equalTo(KscreenW)
            make.height.equalTo(50)
            make.top.equalTo(100)
        }
        table.snp.makeConstraints { (make) in
            make.width.equalTo(KscreenW)
            make.height.equalTo(88)
            make.top.equalTo(bigTitle.snp.bottom)
        }
        imageButton.snp.makeConstraints { (make) in
            make.width.equalTo(100)
            make.height.equalTo(100)
            make.top.equalTo(table.snp.bottom)
            make.centerX.equalTo(view.center.x)
        }
        changeButton.snp.makeConstraints { (make) in
            make.width.equalTo(100)
            make.height.equalTo(50)
            make.top.equalTo(imageButton.snp.bottom)
            make.centerX.equalTo(view.center.x)
        }
    }
}
