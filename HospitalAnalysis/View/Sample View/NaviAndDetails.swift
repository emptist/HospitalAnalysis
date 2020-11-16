//
//  NaviAndDetails.swift
//  HospitalAnalysis
//
//  Created by jk on 2020/11/16.
//  Copyright © 2020 ssl. All rights reserved.
//

import SwiftUI

struct NaviAndDetails<GeneralElement: NamedEntityWithSample>: View {
    @EnvironmentObject var userData: UserData<GeneralElement>
    
    var body: some View {
        NavigationView {
            NavigationPrimary<GeneralElement>()
            
            ElementView<GeneralElement>()
        }
        //.padding()
        //.frame(minWidth: 700, minHeight: 400)
    }
}

struct NaviAndDetails_Previews: PreviewProvider {
    static var previews: some View {
        NaviAndDetails<EvalIndicator>().environmentObject(UserData<EvalIndicator>())
    }
}
