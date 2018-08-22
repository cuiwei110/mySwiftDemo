//
//  ColorViewController.swift
//  Demo5-SwiftTheme
//
//  Created by cuizongwei on 22/8/18.
//  Copyright © 2018年 cuizongwei. All rights reserved.
//

import UIKit

class ColorViewController: UIViewController {
    lazy var blueView:UIView = {
        let blue = UIView()
        blue.backgroundColor = UIColor.blue
        return blue
    }()
    lazy var yellowView:UIView = {
        let yellow = UIView()
        yellow.backgroundColor = UIColor.yellow
        return yellow
    }()
    lazy var greenView:UIView = {
        let green = UIView()
        green.backgroundColor = UIColor.green
        return green
    }()
    lazy var button:UIButton = {
        let button = UIButton()
        button.setTitle("关闭", for: .normal)
        button.backgroundColor = UIColor.blue
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        _setUpUI()
        button.addTarget(self, action: #selector(closeView), for: .touchUpInside)
    }
    @objc private func closeView() {
        dismiss(animated: true) {            
        }
    }

}
//MARK:设置UI
extension ColorViewController {
    private func _setUpUI() {
        view.backgroundColor = UIColor.white
        view.addSubview(blueView)
        view.addSubview(yellowView)
        view.addSubview(greenView)
        view.addSubview(button)
        
        blueView.snp.makeConstraints { (make) in
            make.width.equalTo(KscreenW-20)
            make.height.equalTo(100)
            make.top.equalTo(50)
            make.centerX.equalTo(view.center.x)
        }
        yellowView.snp.makeConstraints { (make) in
            make.width.equalTo(KscreenW-20)
            make.height.equalTo(100)
            make.top.equalTo(blueView.snp.bottom).offset(20)
            make.centerX.equalTo(view.center.x)
        }
        greenView.snp.makeConstraints { (make) in
            make.width.equalTo(KscreenW-20)
            make.height.equalTo(100)
            make.top.equalTo(yellowView.snp.bottom).offset(20)
            make.centerX.equalTo(view.center.x)
        }
        button.snp.makeConstraints { (make) in
            make.width.equalTo(KscreenW)
            make.height.equalTo(50)
            make.top.equalTo(greenView.snp.bottom)
        }
    }
}
