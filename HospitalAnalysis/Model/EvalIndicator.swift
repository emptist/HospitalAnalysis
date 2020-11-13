//
//  EvalIndicator.swift
//  HospitalPerformanceGrade3
//
//  Created by jk on 2020/11/2.
//  Copyright © 2020 ssl. All rights reserved.
//

import Foundation



struct EvalIndicator: NamedEntityWithSample {
    // 每次均应提供不同的 instance
    // 若须固定,则可在 view model class 内设置变量以记忆之
    static var sampleInstance: EvalIndicator {
        EvalIndicator(name: "default")
    }
    
    var name: String
    var favor: Bool = false
    var id = UUID()

    var 指标名称: String {
        name
    }
    var 指标定义: String = ""
    var 计算方法: String = ""
    var 指标说明: String = ""
    var 指标意义: String = ""
    
    var 指标导向: String = "" // 逐步提高/降低/监测对比
    var 指标属性: String = ""
    var 计量单位: String = ""
    var 指标来源: String = ""
    var 数据责任科室: String = ""
    var 指标解释: String = ""
    var 所属体系: String = ""
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

    var pinyin: String {
        return name.applyingTransform(.toLatin, reverse: false) ?? name
    }
    
}

//struct EvalIndicator: Codable {
//    var id = UUID()
//    var name: String
//    var basis: Indicator?
//    var value: Double
//    var favor: Bool = false
//}

