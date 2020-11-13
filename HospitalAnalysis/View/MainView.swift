//
//  ContentView.swift
//  FixHospitalPosts
//
//  Created by jk on 2020/7/18.
//  Copyright © 2020 ssl. All rights reserved.
//

import SwiftUI


struct MainView: View {
    @EnvironmentObject var userData: UserData<EvalIndicator>
    
    var body: some View {
        NavigationView {
            NavigationPrimary<EvalIndicator>()
            
            //NavigationTab(selectedIndex: selectedIndex)
        }
        .frame(minWidth: 700, minHeight: 400)
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environmentObject(UserData<EvalIndicator>())
    }
}

