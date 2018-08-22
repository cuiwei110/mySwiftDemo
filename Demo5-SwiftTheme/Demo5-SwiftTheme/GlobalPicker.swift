//
//  GlobalPicker.swift
//  Demo5-SwiftTheme
//
//  Created by cuizongwei on 22/8/18.
//  Copyright © 2018年 cuizongwei. All rights reserved.
//

import SwiftTheme

enum GlobalPicker {
    static let backgroundColor: ThemeColorPicker = ["#fff", "#fff", "#fff", "#292b38"]
    static let textColor: ThemeColorPicker = ["#000", "#EEE", "#000", "#ECF0F1"]
    
    static let barTextColors = ["#FFF", "#000", "#FFF", "#FFF"]
    static let barTextColor = ThemeColorPicker.pickerWithColors(barTextColors)
    static let barTintColor: ThemeColorPicker = ["#EB4F38", "#F4C600", "#56ABE4", "#01040D"]

}
