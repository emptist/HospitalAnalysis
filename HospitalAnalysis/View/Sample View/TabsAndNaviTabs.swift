//
//  TabsAndNaviTabs.swift
//  HospitalAnalysis
//
//  Created by jk on 2020/11/16.
//  Copyright © 2020 ssl. All rights reserved.
//

import SwiftUI

struct TabsAndNaviTabs<GeneralElement: NamedEntityWithSample>: View {
    @EnvironmentObject var userData: UserData<GeneralElement>
    
    
    var body: some View {
        //VStack(alignment: .leading, spacing: 12) {
        VStack {
            //DetailHead(elementIndex:selectedIndex)
            
            TabView {
                ElementMain<GeneralElement>()
                    .tabItem {Text("\(userData.elements[userData.selectedIndex].name)")}
                //.padding()
                ElementMain<GeneralElement>()
                    .tabItem {Text("\(userData.elements[userData.selectedIndex].name)")}
                //.padding()
            }
        }
    }
}



struct TabsAndNaviTabs_Previews: PreviewProvider {
    static var previews: some View {
        TabsAndNaviTabs<EvalIndicator>().environmentObject(UserData<EvalIndicator>())
    }
}
