//
//  EvalIndicator.swift
//  HospitalPerformanceGrade3
//
//  Created by jk on 2020/11/2.
//  Copyright © 2020 ssl. All rights reserved.
//

import Foundation



struct EvalIndicator: Codable,Identifiable,Hashable,Loopable,NamedEntity {
    static var sample = EvalIndicator(指标名称: "new indicator", 指标定义: "", 计算方法: "", 指标说明: "", 指标意义: "", 指标导向: "", 计量单位: "", 数据责任科室: "")
    
    var 指标名称: String
    var 指标定义: String
    var 计算方法: String
    var 指标说明: String
    var 指标意义: String
    
    var 指标导向: String // 逐步提高/降低/监测对比
    var 指标属性: String = "定量"
    var 计量单位: String // 比值
    var 指标来源: String = "医院填报"
    var 数据责任科室: String
    var 指标解释: String = "艾力彼"
    var 所属体系: String = "艾力彼"
    var weight: Double = 0
    var valueY_1: Double = 0
    var valueY_2: Double = 0
    var valueY_3: Double = 0
    
//    // enums
//    var 指标导向: 指标导向
//    var 指标属性: 指标属性
//    var 计量单位: 计量单位
//    var 指标来源: 指标来源
//    var 指标解释: 绩效考核机构
//    var 所属体系: Array<考评体系>
//
    var favor: Bool = false
    var id = UUID()
    
    var pinyin: String {
        return name.applyingTransform(.toLatin, reverse: false) ?? name
    }
    var name: String {
        get {
            指标名称
        }
        set {
            指标名称 = newValue
        }
        
    }
    
}

//struct EvalIndicator: Codable {
//    var id = UUID()
//    var name: String
//    var basis: Indicator?
//    var value: Double
//    var favor: Bool = false
//}

