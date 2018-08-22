//
//  RootViewController.swift
//  Demo5-SwiftTheme
//
//  Created by cuizongwei on 22/8/18.
//  Copyright © 2018年 cuizongwei. All rights reserved.
//

import UIKit

class RootViewController: UITabBarController {
    let NameArr = ["主页"]
    let PicArr = ["main"]
    let selectedPicArr = ["main_selected"]
    let VCArr = [FirstViewController()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 设置底部tab栏的背景颜色
        // self.tabBar.barTintColor = UIColor.blue // **底部菜单条的背景颜色
        // self.tabBar.tintColor = UIColor.orange  // **底部菜单条的字体渲染颜色
        /// **设置底部菜单的字体颜色和字号等
        let barDict:NSDictionary = [NSAttributedStringKey.foregroundColor: UIColor.black,NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 12)]
        let selectedbarDict:NSDictionary = [NSAttributedStringKey.foregroundColor: UIColor.orange,NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 12)]
        UITabBarItem.appearance().setTitleTextAttributes(barDict as? [NSAttributedStringKey : Any], for: UIControlState.normal)
        UITabBarItem.appearance().setTitleTextAttributes(selectedbarDict as? [NSAttributedStringKey : Any], for: UIControlState.selected)
        
        /// 添加视图控制器
        for i in 0..<NameArr.count {
            if i == 0 {
                addChildVCWithNav(childVC: VCArr[i], childTitle: NameArr[i], imageName: PicArr[i], selectedImageName: selectedPicArr[i])
            } else {
                addChildVCWithOutNav(childVC: VCArr[i], childTitle: NameArr[i], imageName: PicArr[i], selectedImageName: selectedPicArr[i])
            }
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
extension RootViewController {
    /// 添加子控制器---带有导航控制器
    private func addChildVCWithNav(childVC: UIViewController, childTitle: String, imageName: String, selectedImageName:String)
    {
        let navigation = UINavigationController(rootViewController: childVC)
        navigation.navigationBar.tintColor = UIColor.white // 导航栏字体的颜色
        navigation.navigationBar.barTintColor = UIColor.orange //导航栏背景颜色
        let dict:NSDictionary = [NSAttributedStringKey.foregroundColor: UIColor.white,NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 18)]
        //标题颜色
        navigation.navigationBar.titleTextAttributes = dict as? [NSAttributedStringKey : Any]
        childVC.title = childTitle
        childVC.tabBarItem.tag = 1
        childVC.tabBarItem.image  = UIImage.init(named: imageName)
        childVC.tabBarItem.selectedImage = UIImage.init(named: selectedImageName)
        self.addChildViewController(navigation)
    }
    /// 添加子控制器--不带导航控制器
    private func addChildVCWithOutNav(childVC: UIViewController, childTitle: String, imageName: String, selectedImageName:String)
    {
        childVC.title = childTitle
        childVC.tabBarItem.tag = 1
        childVC.tabBarItem.image  = UIImage.init(named: imageName)
        childVC.tabBarItem.selectedImage = UIImage.init(named: selectedImageName)
        self.addChildViewController(childVC)
    }
    
}
