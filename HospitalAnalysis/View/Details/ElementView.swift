//
//  ElementView.swift
//  HospitalAnalysis
//
//  Created by jk on 2020/11/13.
//  Copyright © 2020 ssl. All rights reserved.
//

import SwiftUI

struct ElementView<GeneralElement: NamedEntityWithSample>: View {
    @EnvironmentObject var userData: UserData<GeneralElement>
    
    var body: some View {
        VStack(alignment: .leading) {
            Group {
                Text("ID: \(userData.elements[userData.selectedIndex].id)")
                
                
                TextField("name",text: $userData.elements[userData.selectedIndex].name)
                    .hLabel(label: "Name")
                
//                TextField("指标定义",text: $userData.elements[elementIndex].指标定义)
//                    .hLabel(label: "指标定义")
//                //", 计算方法: "计算方法", 指标说明: "说明", 指标意义: "意义", 指标导向: .监测比较, 指标属性: .定量指标, 计量单位: .比值, 指标来源: .医院填报, 指标解释: .省级卫健委, 所属体系: [.国考三级]
//                
//                TextField("指标说明",text: $userData.elements[elementIndex].指标说明)
//                    .hLabel(label: "指标说明")
//                
//                TextField("指标意义",text: $userData.elements[elementIndex].指标说明)
//                    .hLabel(label: "指标意义")
//                
//                TextField("计算方法",text: $userData.elements[elementIndex].计算方法)
//                    .hLabel(label: "计算方法")
            }
        }
        
    }
}

//struct ElementView_Previews: PreviewProvider {
//    static var previews: some View {
//        ElementView<EvalIndicator>().environmentObject(UserData<EvalIndicator>())
//    }
//}
