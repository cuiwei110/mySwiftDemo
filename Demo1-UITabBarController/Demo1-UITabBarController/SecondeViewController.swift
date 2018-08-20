//
//  SecondeViewController.swift
//  Demo1-UITabBarController框架
//
//  Created by cuizongwei on 19/8/18.
//  Copyright © 2018年 cuizongwei. All rights reserved.
//

import UIKit

class SecondeViewController: UIViewController {
    lazy var lable:UILabel = {
        let frame = CGRect.init(x: 10, y: 100, width: 100, height: 100)
        let first_lable = UILabel.init(frame: frame)
        return first_lable
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.gray
        view.addSubview(lable)
        lable.text = "第二页"

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
