//
//  NavigationDetail.swift
//  FixHosTechPosts
//
//  Created by jk on 2020/7/26.
//  Copyright © 2020 ssl. All rights reserved.
//

import SwiftUI

struct NavigationTab<GeneralElement: NamedEntityWithSample>: View {
    @EnvironmentObject var userData: UserData<GeneralElement>
    
    
    var body: some View {
        //VStack(alignment: .leading, spacing: 12) {
        VStack {
            //DetailHead(elementIndex:selectedIndex)
            
            TabView {
                MainView<GeneralElement>()
                    .tabItem {Text("\(GeneralElement.sampleInstance.name)")}
                    .padding()
            }
        }
    }
}




struct NavigationTab_Preview: PreviewProvider {
    static var previews: some View {
        NavigationTab<EvalIndicator>().environmentObject(UserData<EvalIndicator>())
    }
}
