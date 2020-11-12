//
//  UserData.swift
//  FixHospitalPosts
//
//  Created by jk on 2020/7/18.
//  Copyright © 2020 ssl. All rights reserved.
//

import Combine
import SwiftUI
//import SwiftShell

/// Creating A PDF File
/// pandoc -s -f markdown -t html *.techs.md -o techs.pdf --metadata title="report"
/// open techs.pdf
///
/// Creating A ODT File
/// pandoc -s -f markdown -t odt *.techs.md -o techs.odt --reference-doc=style_reference.odt
///


//let sample = EvalIndicator(指标名称: "门诊人次数与出院人次数比", 指标定义: "", 计算方法: "", 指标说明: "", 指标意义: "", 指标导向: "监测对比", 计量单位: "比值", 数据责任科室: "医务科")


final class UserData<Element: NamedEntity>: ObservableObject  {
    var dh: DataIOHelper<Element>
    var sample: Element
    var filename: String
    
    @Published var showKeysOnly = false
    @Published var elements: Array<Element> {//= elementData {
        didSet {
            DispatchQueue.global(qos: .userInitiated).async {
                self.dh.save(self.elements)
            }
        }
    }

    init(filename: String, sample: Element) {
        self.sample = sample
        self.filename = filename
        self.dh = DataIOHelper<Element>(filename: filename)
        self.elements = self.dh.load(sample)
    }
    func addElement(_ newName: String) -> Void {
        for each in elements {
            if each.name == newName {
                return
            }
        }
        sample.name = newName
        elements.append(sample)
    }
    
    
}


extension EvalIndicator {

    func writeReport(_ report: String, to filename: String) -> Void {
        do {
            try report.write(to: URL(fileURLWithPath: filename), atomically: true, encoding: .utf8)
        }
        catch {
            fatalError("Couldn't save to \(filename) in main bundle")
        }
        
    }
}
