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



final class UserData<GeneralElement: NamedEntityWithSample>: ObservableObject  {
    //var dh: DataIOHelper<GeneralElement>
    //var sampleInstance = GeneralElement.sampleInstance
    
    let filename: String = "\(GeneralElement.self)".lowercased() + "s.json"
    
    @Published var showKeysOnly = false
    @Published var elements: Array<GeneralElement>! {//= elementData {
        didSet {
            DispatchQueue.global(qos: .userInitiated).async {
                self.save(self.elements)
            }
        }
    }
    @Published var selectedElement: GeneralElement?
    
    var selectedIndex: Int {
        elements.firstIndex(where: {
            $0.id == selectedElement?.id
        }) ?? 0
    }
    
    init() {
        self.elements = self.load(GeneralElement.sampleInstance)
    }
    
    
    func addElement(_ newName: String) -> Void {
        for each in elements {
            if each.name == newName { return }
        }
        var sampleInstance = GeneralElement.sampleInstance
        sampleInstance.name = newName
        elements.append(sampleInstance)
        selectedElement = elements.first {$0.id == sampleInstance.id}
    }
    
    let vapper: Bool = true
    let dev = true
    
    func load(_ sampleInstance: GeneralElement) -> Array<GeneralElement> {
        let data: Data
        let file: URL
        if FileManager().fileExists(atPath: filename) {
            file = URL(fileURLWithPath: filename)
        } else if vapper {
            return [sampleInstance]
        } else {
            file = Bundle.main.url(forResource: filename, withExtension: nil)!
        }
        
        // main bundle not working?
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
            return try decoder.decode(Array<GeneralElement>.self, from: data)
        } catch {
            if dev {
                return [sampleInstance]
            }
            else {
                fatalError("Couldn't parse \(filename) as \(GeneralElement.self):\n\(error)")
            }
            
            
        }
    }
    
    func save(_ data: Array<GeneralElement>) {
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
