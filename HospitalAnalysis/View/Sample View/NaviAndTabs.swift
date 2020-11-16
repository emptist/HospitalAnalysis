//
//  NavigationPrimaryAndTabs.swift
//  HospitalAnalysis
//
//  Created by jk on 2020/11/16.
//  Copyright © 2020 ssl. All rights reserved.
//

import SwiftUI

struct NaviAndTabs<GeneralElement: NamedEntityWithSample>: View {
    @EnvironmentObject var userData: UserData<GeneralElement>
    
    
    var body: some View {
        ElementMain<GeneralElement>()
        .padding()
    }
}




struct NaviAndTabs_Previews: PreviewProvider {
    static var previews: some View {
        NaviAndTabs<EvalIndicator>().environmentObject(UserData<EvalIndicator>())
    }
}
