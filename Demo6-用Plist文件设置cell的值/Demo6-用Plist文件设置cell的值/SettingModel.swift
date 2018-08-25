//
//  SettingModel.swift
//  Demo6-用Plist文件设置cell的值
//
//  Created by cuizongwei on 24/8/18.
//  Copyright © 2018年 cuizongwei. All rights reserved.
//

import UIKit

class SettingModel {
    var title: String?
    var subtitle: String?
    var rightTitle: String?
    var isHiddenLine: Bool?
    var isHiddenSubtitle: Bool?
    var isHiddenSwitch: Bool?
    var isHiddenArraw: Bool?
    var isHiddenRightTitle: Bool?
    
    init(dict: [String: AnyObject]) {
        title = dict["title"] as? String
        subtitle = dict["subtitle"] as? String
        rightTitle = dict["rightTitle"] as? String
        isHiddenLine = dict["isHiddenLine"] as? Bool
        isHiddenSubtitle = dict["isHiddenSubtitle"] as? Bool
        isHiddenArraw = dict["isHiddenArraw"] as? Bool
        isHiddenSwitch = dict["isHiddenSwitch"] as? Bool
        isHiddenRightTitle = dict["isHiddenRightTitle"] as? Bool
    }
}
