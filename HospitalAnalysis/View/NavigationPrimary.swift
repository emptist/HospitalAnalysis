//
//  NavigationPrimary.swift
//  FixHospitalPosts
//
//  Created by jk on 2020/7/18.
//  Copyright © 2020 ssl. All rights reserved.
//

import SwiftUI

struct NavigationPrimary<GeneralElement: NamedEntity>: View {
    @EnvironmentObject var userData: UserData<GeneralElement>
    @Binding var selectedElement: GeneralElement?
    
    @State var newName: String = ""
    
    fileprivate func addItem() {
        for each in self.userData.elements {
            if each.name == self.newName {
                return
            }
        }
        self.userData.addElement(newName)
//        self.userData.elements.append(HIndicator(指标名称: newName, 指标定义: "a", 计算方法: "bc", 指标说明: "c", 指标意义: "d", 指标导向: .监测比较, 指标属性: .定性指标, 计量单位: .比值, 指标来源: .医院填报, 指标解释: .省级卫健委, 所属体系: [.国考三级,.艾力彼排名体系]))
    }
    
    var body: some View {
        VStack {
            ElementList(selectedElement: $selectedElement)
                .listStyle(SidebarListStyle())
            
            
            HStack {
                
//                制作报告
//                Button(action: {
//                    guard let selectedElement = self.selectedElement else {
//                        return self.userData.saveReport()
//                    }
//                    self.userData.saveReport(selectedElement)
//                    //self.userData.saveReport()
//                }) {
//                    Text("S")
//                }
                
                TextField("Add " + "\(GeneralElement.self)", text: $newName)
                Button(action: {
                    //self.addItem()
                    self.userData.addElement(self.newName)
                    self.selectedElement = self.userData.elements.first(where: {
                        $0.name == self.newName
                    })
                }) {
                    Text("Add")
                }
            }.padding()
            
        }
            .frame(minWidth: 225, maxWidth: 300)
    }
}

struct NavigationPrimary_Previews: PreviewProvider {
    static var previews: some View {
        let userData = UserData<EvalIndicator>()
        return NavigationPrimary<EvalIndicator>(selectedElement: .constant(userData.elements[0])).environmentObject(userData)
    }
}
