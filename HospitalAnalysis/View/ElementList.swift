//
//  ElementList.swift
//  FixHospitalPosts
//
//  Created by jk on 2020/7/18.
//  Copyright © 2020 ssl. All rights reserved.
//

import SwiftUI

struct ElementList<GeneralElement: NamedEntity>: View {
    @EnvironmentObject private var userData: UserData<GeneralElement>
    @Binding var selectedElement: GeneralElement?
    //@Binding var filter: FilterType
    
    var body: some View {
        List { //(selection: $selectedElement) {
            ForEach(userData.elements.sorted(by: { ela, elb in ela.pinyin < elb.pinyin })) { element in
                if (!self.userData.showKeysOnly || element.favor){
                    ElementRow(element:element)
                        .tag(element)
                        .onTapGesture(count: 2) {
                            guard let ele = self.selectedElement else {
                                return
                            }
                            guard let idx = self.userData.elements.firstIndex(of: ele) else {
                                return
                            }
                            self.userData.elements.remove(at: idx) //(where:{element in element.指标名称 == self.selectedElement?.指标名称})
                    }
                }
                
            }
        }
    }
}

