//
//  AdvertiseViewController.swift
//  Demo7-制作Splash广告页面
//
//  Created by cuizongwei on 25/8/18.
//  Copyright © 2018年 cuizongwei. All rights reserved.
//

import UIKit

class AdvertiseViewController: UIViewController {
    /// 延迟 2 秒
    private var time: TimeInterval = 4.0
    private var countdownTimer: Timer?
    lazy var timeButton:UIButton = {
        let frame = CGRect.init(x: 10, y: 30, width: 100, height: 50)
        let btn = UIButton.init(frame: frame)
        btn.backgroundColor = UIColor.blue
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        view.addSubview(timeButton)
        timeButton.addTarget(self, action: #selector(timeButtonClick), for: .touchUpInside)
        
        // 倒计时器
        countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        
    }
    
    @objc func updateTime() {
        if time == 0 {
            countdownTimer?.invalidate()
//            let sb = UIStoryboard(name: "Main", bundle: nil)
//            let tabBarVC = sb.instantiateViewController(withIdentifier: String(describing: RootViewController.self)) as! MyTabBarController
//            tabBarVC.delegate = self
            UIApplication.shared.keyWindow?.rootViewController = RootViewController()
        } else {
            time -= 1
            timeButton.setTitle(String(format: "%.0f s 跳过", time), for: .normal)
        }
        
    }
    /// button 点击事件
    @objc func timeButtonClick() {
        countdownTimer?.invalidate() // 移除计时器
        UIApplication.shared.keyWindow?.rootViewController = RootViewController()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


// MARK: - 监听 tabbar 点击
extension AdvertiseViewController: UITabBarControllerDelegate {
    /// 点击了哪个 tabbar
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "TabBarDidSelectedNotification"), object: nil)
    }
    
}
