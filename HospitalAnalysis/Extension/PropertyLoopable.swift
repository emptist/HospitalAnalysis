//
//  PropertyLoopable.swift
//  HospitalPerformanceGrade3
//
//  Created by jk on 2020/11/3.
//  Copyright © 2020 ssl. All rights reserved.
//

import Foundation

// https://stackoverflow.com/questions/27292255/how-to-loop-over-struct-properties-in-swift

protocol Loopable {
    func allProperties() throws -> [String: Any]
}

extension Loopable {
    func allProperties() throws -> [String: Any] {
        
        var result: [String: Any] = [:]
        
        let mirror = Mirror(reflecting: self)
        
        // Optional check to make sure we're iterating over a struct or class
        guard let style = mirror.displayStyle, style == .struct || style == .class else {
            throw NSError()
        }
        
        for (property, value) in mirror.children {
            guard let property = property else {
                continue
            }
            
            result[property] = value
        }
        
        return result
    }
}
