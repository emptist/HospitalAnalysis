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



final class UserData<Element: NamedEntity>: ObservableObject  {
    //var dh: DataIOHelper<Element>
    var sample: Element!
    var filename: String = "\(Element.self)".lowercased() + "s.json"
    
    @Published var showKeysOnly = false
    @Published var elements: Array<Element>! {//= elementData {
        didSet {
            DispatchQueue.global(qos: .userInitiated).async {
                self.save(self.elements)
            }
        }
    }

    init(filename: String, sample: Element) {
        self.sample = sample
        self.filename = filename
        
        // we can do this since sample, filename, and elements have already been initialized with nil
        self.elements = self.load(sample)
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
