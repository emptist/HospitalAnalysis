//
//  NamedEntity.swift
//  HospitalAnalysis
//
//  Created by jk on 2020/11/12.
//  Copyright © 2020 ssl. All rights reserved.
//

import Foundation

// CaseIterable

protocol NamedEntity: Codable,Identifiable,Hashable,Loopable {
    var id: UUID {get set}
    var name: String {get set}
    var favor: Bool {get set}
    var pinyin: String {get}
}

protocol NamedEntityWithSample: NamedEntity {
    static var sampleInstance: Self {get}
}


func generalName<GeneralElement>(_ ge: GeneralElement) -> String {
    "\(ge.self)".lowercased()
}

