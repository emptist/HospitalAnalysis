//
//  Dimension.swift
//  HospitalAnalysis
//
//  Created by jk on 2020/11/12.
//  Copyright © 2020 ssl. All rights reserved.
//

import Foundation


struct Dimension: Codable,Identifiable,Hashable,Loopable {
    var id = UUID()
    var name: String
    var level: Int
    var weight: Double = 0
    var valueY1: Double
    var valueY2: Double
    var valueY3: Double
    // exclusive
    var dimensions: Array<Dimension>?
    var indicators: Array<EvalIndicator>?
}

