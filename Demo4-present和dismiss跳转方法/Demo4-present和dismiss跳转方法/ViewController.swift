//
//  ViewController.swift
//  Demo4-present和dismiss跳转方法
//
//  Created by cuizongwei on 21/8/18.
//  Copyright © 2018年 cuizongwei. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    lazy var lable:UILabel = {
        let frame = CGRect.init(x: 100, y: 100, width: 300, height: 50)
        let lable = UILabel.init(frame: frame)
        lable.text = "登录"
        return lable
    }()
    lazy var btn_login:UIButton = {
        let frame = CGRect.init(x: 100, y: 200, width: 300, height: 100)
        let btn = UIButton.init(frame: frame)
        btn.setTitle("登录按钮", for: .normal)
        btn.setTitleColor(UIColor.blue, for: .normal)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        view.addSubview(lable)
        view.addSubview(btn_login)
        
        btn_login.addTarget(self, action: #selector(presentLogin), for: UIControlEvents.touchUpInside)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
extension ViewController {
    @objc private func presentLogin() {
        present(LoginViewController(), animated: true) {
            print("弹出登录视图")
        }
    }
}

