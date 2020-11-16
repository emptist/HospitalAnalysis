//
//  ContentView.swift
//  FixHospitalPosts
//
//  Created by jk on 2020/7/18.
//  Copyright © 2020 ssl. All rights reserved.
//

import SwiftUI


struct IndicatorMain: View {
    var body: some View {
//        TabsAndNaviDetails<EvalIndicator>()
//            .environmentObject(UserData<EvalIndicator>())

        ElementMain<EvalIndicator>().environmentObject(UserData<EvalIndicator>())
    }
}

struct IndicatorMain_Previews: PreviewProvider {
    static var previews: some View {
        IndicatorMain().environmentObject(UserData<EvalIndicator>())
    }
}

