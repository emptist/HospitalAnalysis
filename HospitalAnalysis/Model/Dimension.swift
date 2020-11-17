//
//  Dimension.swift
//  HospitalAnalysis
//
//  Created by jk on 2020/11/12.
//  Copyright © 2020 ssl. All rights reserved.
//

import Foundation


struct Dimension: NamedEntityWithSample {//Codable,Identifiable,Hashable,Loopable {
    static var sampleInstance: Self {
        Self(name: "default")
    }
    
    var name: String
    
    var id = UUID()
    var favor: Bool = false
    var level: Int = 0
    var weight: Double = 0
    var valueY1: Double = 0
    var valueY2: Double = 0
    var valueY3: Double = 0
    
    // exclusive
    var dimensions: Array<Dimension>? = Array<Dimension>()
    var indicators: Array<EvalIndicator>? = Array<EvalIndicator>()
    
    var pinyin: String {
        name.applyingTransform(.toLatin, reverse: false) ?? name
    }
    
}

