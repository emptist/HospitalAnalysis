//
//  ContentView.swift
//  FixHospitalPosts
//
//  Created by jk on 2020/7/18.
//  Copyright © 2020 ssl. All rights reserved.
//

import SwiftUI


struct IndicatorMain: View {
    @EnvironmentObject var userData: UserData<EvalIndicator>
    
    var selectedIndex: Int {
        userData.elements.firstIndex(where: { $0.id == self.userData.selectedElement?.id }) ?? 0
    }
    
    var body: some View {
        NavigationView {
            NavigationPrimary<EvalIndicator>()//(selectedElement: $selectedElement)
            
            //NavigationTab(selectedIndex: selectedIndex)
        }
        .frame(minWidth: 700, minHeight: 400)
        
    }
}

struct IndicatorMain_Previews: PreviewProvider {
    static var previews: some View {
        IndicatorMain().environmentObject(UserData<EvalIndicator>())
    }
}

