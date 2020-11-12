//
//  NamedEntity.swift
//  HospitalAnalysis
//
//  Created by jk on 2020/11/12.
//  Copyright © 2020 ssl. All rights reserved.
//

import Foundation

protocol NamedEntity: Codable {
    var name: String {get set}
    static var sample: Self {get}
    var favor: Bool {get set}
}

func generalName<GeneralElement>(_ ge: GeneralElement) -> String {
    "\(ge.self)".lowercased()
}

