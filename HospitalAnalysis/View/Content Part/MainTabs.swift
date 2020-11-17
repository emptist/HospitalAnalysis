//
//  MainTabs.swift
//  HospitalAnalysis
//
//  Created by jk on 2020/11/17.
//  Copyright © 2020 ssl. All rights reserved.
//

import SwiftUI

struct MainTabs<GeneralElement: NamedEntityWithSample>: View {
    @EnvironmentObject var userData: UserData<GeneralElement>
    
    
    var body: some View {
        VStack {
            TabView {
                HospitalEvaluate()
                    .tabItem {
                        Text("综合评价")
                }
                DepartmentEvaluate()
                    .tabItem {
                        Text("专科排次")
                }
                ComprehensiveIndicators()
                    .tabItem {
                        Text("医院指标")
                }
                SpecializedIndicators()
                    .tabItem {
                        Text("专科指标")
                }
            }
        }
    }
}





struct MainTabs_Previews: PreviewProvider {
    static var previews: some View {
        MainTabs<EvalIndicator>().environmentObject(UserData<EvalIndicator>())
    }
    
}
