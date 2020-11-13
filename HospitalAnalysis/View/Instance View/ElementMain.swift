//
//  ElementMain.swift
//  HospitalAnalysis
//
//  Created by jk on 2020/11/14.
//  Copyright © 2020 ssl. All rights reserved.
//

import SwiftUI

struct ElementMain<GeneralElement: NamedEntityWithSample>: View {
    @EnvironmentObject var userData: UserData<GeneralElement>
    
    var body: some View {
        NavigationView {
            NavigationPrimary<GeneralElement>()
            
            ElementTab<GeneralElement>()
        }
        //.frame(minWidth: 700, minHeight: 400)
        
    }
}

struct ElementMain_Previews: PreviewProvider {
    static var previews: some View {
        MainView<EvalIndicator>().environmentObject(UserData<EvalIndicator>())
    }
}

