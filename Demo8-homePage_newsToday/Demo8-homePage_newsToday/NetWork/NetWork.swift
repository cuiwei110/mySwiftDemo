//
//  NetWork.swift
//  Demo8-homePage_newsToday
//
//  Created by cuizongwei on 26/8/18.
//  Copyright © 2018年 cuizongwei. All rights reserved.
//

import Foundation
import Moya

enum NetWork {
    case initTitle()
}

extension NetWork: TargetType {
    var baseURL: URL {
        return URL.init(string: "https://is.snssdk.com/")!
    }
    
    var path: String {
        switch self {
        case .initTitle():
            return "article/category/get_subscribed/v1/"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .initTitle():
            return .get
        default:
            return .get
        }
    }
    
    var sampleData: Data {
        return "[{\"name\": \"Repo Name\"}]".data(using: String.Encoding.utf8)!
    }
    
    var task: Task {
        switch self {
        case .initTitle():
            return .requestParameters(parameters: parameters!, encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
    
    var parameters: [String:Any]? {
        /// iid 未登录用户 id，只要安装了今日头条就会生成一个 iid
        /// 可以在自己的手机上安装一个今日头条，然后通过 charles 抓取一下这个 iid，
        /// 替换成自己的，再进行测试
        let IID: String = "5034850950"
        /// iid 和 device_id 好像是绑定到一起的，不对应的话获取不到数据
        let device_id: String = "6096495334"
        
        return ["device_id": device_id,
                "aid": 13,
                "iid": IID]
    }
    
}
