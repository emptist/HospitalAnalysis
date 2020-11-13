//
//  ContentView.swift
//  HospitalAnalysis
//
//  Created by jk on 2020/11/11.
//  Copyright © 2020 ssl. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        MainView().environmentObject(UserData<EvalIndicator>())
    }
}

var numberFormatter: NumberFormatter {
    let f = NumberFormatter()
    f.numberStyle = .decimal
    return f
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
