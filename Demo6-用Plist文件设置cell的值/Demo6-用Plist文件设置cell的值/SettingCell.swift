//
//  SettingCell.swift
//  Demo6-用Plist文件设置cell的值
//
//  Created by cuizongwei on 24/8/18.
//  Copyright © 2018年 cuizongwei. All rights reserved.
//

import UIKit


class SettingCell: UITableViewCell {
    lazy var titleLabel:UILabel! = {
        let lable = UILabel()
        return lable
    }()
    lazy var subtitleLabel:UILabel! = {
        let lable = UILabel()
        return lable
    }()
    lazy var rightTitleLabel:UILabel! = {
        let lable = UILabel()
        return lable
    }()
    lazy var arrowImageView:UIImageView! = {
        let imageview = UIImageView()
        return imageview
    }()
    lazy var switchView:UISwitch! = {
        let switchview = UISwitch()
        return switchview
    }()
    lazy var lineView:UIView! = {
        let line = UIView()
        return line
    }()
    var subtitleHeight:NSLayoutConstraint!
    
    var setting: SettingModel! {
        didSet {
            titleLabel.text = setting.title
            subtitleLabel.text = setting.subtitle
            rightTitleLabel.text = setting.rightTitle
            arrowImageView.isHidden = setting.isHiddenArraw!
            switchView.isHidden = setting.isHiddenSwitch!
            lineView.isHidden = setting.isHiddenLine!
            rightTitleLabel.isHidden = setting.isHiddenRightTitle!
//            if setting.subtitle!.characters.count > 0 {
//                subtitleHeight.constant = self.frame.size.height * 0.5
//                self.layoutIfNeeded()
//            }
        }
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpUI()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}

extension SettingCell {
    fileprivate func setUpUI() {
        self.addSubview(titleLabel)
        self.addSubview(subtitleLabel)
        self.addSubview(rightTitleLabel)
        self.addSubview(arrowImageView)
        self.addSubview(switchView)
        self.addSubview(lineView)
        titleLabel.snp.makeConstraints { (make) in
            make.width.equalTo(120)
            make.height.equalTo(40)
            make.left.equalTo(30)
            make.top.equalTo(5)
        }
        rightTitleLabel.snp.makeConstraints { (make) in
            make.width.equalTo(80)
            make.height.equalTo(40)
            make.right.equalTo(-10)
            make.centerY.equalTo(titleLabel.snp.centerY)
        }
        switchView.snp.makeConstraints { (make) in
            make.centerY.equalTo(titleLabel.snp.centerY)
            make.left.equalTo(280)
        }

        
    }
}
