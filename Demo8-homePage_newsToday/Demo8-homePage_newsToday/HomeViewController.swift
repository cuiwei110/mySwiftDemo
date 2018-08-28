//
//  HomeViewController.swift
//  Demo8-homePage_newsToday
//
//  Created by cuizongwei on 26/8/18.
//  Copyright © 2018年 cuizongwei. All rights reserved.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    
    fileprivate lazy var pageView: HomePageView = {
        let pageView = HomePageView()
        return pageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        NetWorkTools.loadHomeTitlesData(fromViewController: String(describing: HomeViewController.self)) { (topTitles, homeTopicVCs) in
            // 将所有子控制器添加到父控制器中
            for childVc in homeTopicVCs {
                self.addChildViewController(childVc)
            }
            self.setupUI()
            
            self.pageView.titles = topTitles
            self.pageView.childVcs = self.childViewControllers as? [TopicViewController]
        }
        
    }

//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        /// 设置导航栏颜色
//        navigationController?.navigationBar.barTintColor = UIColor.orange
//    }
    

    

    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

}


extension HomeViewController {
    
    fileprivate func setupUI() {
        
        view.addSubview(pageView)
        
        pageView.snp.makeConstraints { (make) in
            make.left.bottom.right.equalTo(view)
            make.top.equalTo(view).offset(kNavBarHeight)
        }
        
    }
    
    /// 点击了加号按钮
    @objc func homeTitleAddButtonClicked(notification: Notification) {

        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
}

