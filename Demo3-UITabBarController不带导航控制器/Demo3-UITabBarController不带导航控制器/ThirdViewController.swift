//
//  ThirdViewController.swift
//  Demo3-UITabBarController不带导航控制器
//
//  Created by cuizongwei on 21/8/18.
//  Copyright © 2018年 cuizongwei. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    lazy var lable:UILabel = {
        let frame = CGRect.init(x: 10, y: 100, width: 100, height: 100)
        let first_lable = UILabel.init(frame: frame)
        return first_lable
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.gray
        view.addSubview(lable)
        lable.text = "第三页"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
