//
//  NetWorkToos.swift
//  Demo8-homePage_newsToday
//
//  Created by cuizongwei on 26/8/18.
//  Copyright © 2018年 cuizongwei. All rights reserved.
//

import Foundation
import Moya
import SwiftyJSON


protocol NetWorkToolsProtocol {
    /// -------------------------- 首 页 home -------------------------
    /// 获取首页顶部标题内容
    static func loadHomeTitlesData(fromViewController: String, completionHandler:@escaping (_ topTitles: [TopicTitle], _ homeTopicVCs: [TopicViewController])->())
}


class NetWorkTools: NetWorkToolsProtocol {
    /// 获取首页顶部标题内容
    static func loadHomeTitlesData(fromViewController: String, completionHandler: @escaping ([TopicTitle], [TopicViewController]) -> ()) {
         let provider = MoyaProvider<NetWork>()
        provider.request(.initTitle()) { (result) in
            switch result {
            case let .success(respone):
                let json = JSON(respone.data)
                let dataDict = json["data"].dictionary
                if let data = dataDict!["data"]!.arrayObject {
                    var titles = [TopicTitle]()
                    var homeTopicVCs = [TopicViewController]()
                    // 添加推荐标题
                    let recommendDict = ["category": "", "name": "推荐"]
                    let recommend = TopicTitle(dict: recommendDict as [String : AnyObject])
                    titles.append(recommend)
                    // 添加控制器
                    let firstVC = TopicViewController()
                    firstVC.topicTitle = recommend
                    homeTopicVCs.append(firstVC)
                    for dict in data {
                        let topicTitle = TopicTitle(dict: dict as! [String: AnyObject])
                        titles.append(topicTitle)
                        let homeTopicVC = TopicViewController()
                        homeTopicVC.topicTitle = topicTitle
                        homeTopicVCs.append(homeTopicVC)
                    }
                    for name in titles {
                        print("标题的名字是:\(name.name)")
                    }
                    completionHandler(titles, homeTopicVCs)
                }
            case .failure(_): break
                
            }
        }
    }
    
    
}
