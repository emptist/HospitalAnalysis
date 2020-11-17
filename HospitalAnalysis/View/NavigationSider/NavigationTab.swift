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
        VStack {
            TabView {
                Text("简单演示")
                    .tabItem {
                        Text("综合评价")
                }
            }
        }
    }
}




struct NavigationTab_Preview: PreviewProvider {
    static var previews: some View {
        NavigationTab<EvalIndicator>().environmentObject(UserData<EvalIndicator>())
    }
}
