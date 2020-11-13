//
//  ElementList.swift
//  FixHospitalPosts
//
//  Created by jk on 2020/7/18.
//  Copyright © 2020 ssl. All rights reserved.
//

import SwiftUI

struct ElementList<GeneralElement: NamedEntityWithSample>: View {
    @EnvironmentObject private var userData: UserData<GeneralElement>
    
    var body: some View {
        List (selection: $userData.selectedElement) {
            ForEach(userData.elements.sorted { $0.name < $1.name }) { element in
                if (!self.userData.showKeysOnly || element.favor){
                    ElementRow(element:element)
                        .tag(element)
                        .onTapGesture(count: 2) {
                            guard let ele = self.userData.selectedElement else {
                                return
                            }
                            
                            //print("name: \(ele.name) id: \(ele.id)")
                            
                            guard let idx = self.userData.elements.firstIndex(of: ele) else {
                                return
                            }
                            
                            self.userData.elements.remove(at: idx)
                            
                            if idx > 0 {
                                self.userData.selectedElement = self.userData.elements[idx-1]
                            } else if idx < self.userData.elements.count - 1 {
                                self.userData.selectedElement = self.userData.elements[idx+1]
                            }
                            
                    }
                }
                
            }
        }
    }
}


//    @Binding var selectedElement: GeneralElement?
//
//    var body: some View {
//        List (selection: $selectedElement) {
//            ForEach(userData.elements.sorted { $0.name < $1.name }) { element in
//                if (!self.userData.showKeysOnly || element.favor){
//                    ElementRow(element:element)
//                        .tag(element)
//                        .onTapGesture(count: 2) {
//                            guard let ele = self.selectedElement else {
//                                return
//                            }
//
//                            print("name: \(ele.name) id: \(ele.id)")
//
//                            guard let idx = self.userData.elements.firstIndex(of: ele) else {
//                                return
//                            }
//
//                            self.userData.elements.remove(at: idx)
//
//                            if idx > 0 {
//                                self.selectedElement = self.userData.elements[idx-1]
//                            } else if idx < self.userData.elements.count - 1 {
//                                self.selectedElement = self.userData.elements[idx+1]
//                            }
//
//                    }
//                }
//
//            }
//        }
//    }


