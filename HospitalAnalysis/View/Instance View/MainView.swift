//
//  ContentView.swift
//  FixHospitalPosts
//
//  Created by jk on 2020/7/18.
//  Copyright © 2020 ssl. All rights reserved.
//

import SwiftUI


struct MainView<GeneralElement: NamedEntityWithSample>: View {
    @EnvironmentObject var userData: UserData<GeneralElement>
    
    var body: some View {
        NavigationTab<GeneralElement>()
//        NavigationView {
//            NavigationPrimary<GeneralElement>()
//            
//            NavigationTab<GeneralElement>()
//        }
        //.frame(minWidth: 700, minHeight: 400)
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView<EvalIndicator>().environmentObject(UserData<EvalIndicator>())
    }
}

