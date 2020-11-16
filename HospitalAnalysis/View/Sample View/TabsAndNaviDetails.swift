//
//  TabsAndNaviDetails.swift
//  HospitalAnalysis
//
//  Created by jk on 2020/11/16.
//  Copyright © 2020 ssl. All rights reserved.
//

import SwiftUI

struct TabsAndNaviDetails<GeneralElement: NamedEntityWithSample>: View {
    @EnvironmentObject var userData: UserData<GeneralElement>
    
    
    var body: some View {
        //VStack(alignment: .leading, spacing: 12) {
        VStack {
            //DetailHead(elementIndex:selectedIndex)
            
            TabView {
                NaviAndDetails<GeneralElement>()
                    .tabItem {Text("\(userData.elements[userData.selectedIndex].name)")}
                
                NaviAndDetails<GeneralElement>()
                    .tabItem {Text("\(userData.elements[userData.selectedIndex].name)")}
                
            }
        }
    }
}

struct TabsAndNaviDetails_Previews: PreviewProvider {
    static var previews: some View {
        TabsAndNaviDetails<EvalIndicator>().environmentObject(UserData<EvalIndicator>())
    }
}
