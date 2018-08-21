//
//  LoginViewController.swift
//  Demo4-present和dismiss跳转方法
//
//  Created by cuizongwei on 21/8/18.
//  Copyright © 2018年 cuizongwei. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    lazy var lable:UILabel = {
        let frame = CGRect.init(x: 100, y: 100, width: 300, height: 50)
        let lable = UILabel.init(frame: frame)
        lable.text = "这里是登录"
        return lable
    }()
    lazy var btn_close:UIButton = {
        let frame = CGRect.init(x: 0, y: 20, width: 100, height: 100)
        let btn = UIButton.init(frame: frame)
        btn.setTitle("关闭", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        return btn
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        ///
        view.backgroundColor = UIColor.blue
        view.addSubview(lable)
        view.addSubview(btn_close)
        
        btn_close.addTarget(self, action: #selector(closeCurrentView), for: .touchUpInside)

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension LoginViewController {
    @objc private func closeCurrentView() {
        dismiss(animated: true) {
            print("关闭当前视图")
        }
    }
}
