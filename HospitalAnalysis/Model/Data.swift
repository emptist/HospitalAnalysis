//
//  Data.swift
//  FixHospitalPosts
//
//  Created by jk on 2020/7/18.
//  Copyright © 2020 ssl. All rights reserved.
//

import Cocoa
import SwiftUI
import CoreLocation


class DataIOHelper<Element: Codable> {
    let filename: String
    //var sample: Element
    init(filename: String) {
        self.filename = filename
    }
    let vapper: Bool = true
    let dev = true
    
    func load(_ sample: Element) -> Array<Element> {
        let data: Data
        let file: URL
        if FileManager().fileExists(atPath: filename) {
            file = URL(fileURLWithPath: filename)
        } else if vapper {
            return [sample]
        } else {
            file = Bundle.main.url(forResource: filename, withExtension: nil)!
        }
        
        //    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        //        else {
        //            fatalError("Couldn't find \(filename) in main bundle.")
        //    }
        
        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(Array<Element>.self, from: data)
        } catch {
            if dev {
                return [sample]
            }
            else {
                fatalError("Couldn't parse \(filename) as \(Element.self):\n\(error)")
            }
            
            
        }
    }
    
    func save(_ data: Array<Element>) {
        //let dir = FileManager.default.currentDirectoryPath
        let file = URL(fileURLWithPath: filename)
        
        let encoder = JSONEncoder()
        guard let json = try? encoder.encode(data) else {
            fatalError("Couldn't encode data")
        }
        
        do {
            //try FileManager().copyItem(atPath: filename, toPath: filename + ".backup.md")
            
            try json.write(to: file)
        }
        catch {
            fatalError("Couldn't save to \(filename) in main bundle")
        }
    }
}
