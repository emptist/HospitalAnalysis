//
//  NavigationPrimary.swift
//  FixHospitalPosts
//
//  Created by jk on 2020/7/18.
//  Copyright © 2020 ssl. All rights reserved.
//

import SwiftUI

struct NavigationPrimary<GeneralElement: NamedEntityWithSample>: View {
    @EnvironmentObject var userData: UserData<GeneralElement>
    @State var newName: String = ""
    
    fileprivate func addItem() {
        for each in self.userData.elements {
            if each.name == self.newName {
                return
            }
        }
        self.userData.addElement(newName)
    }
    
    var body: some View {
        VStack {
            ElementList<GeneralElement>()
                .listStyle(SidebarListStyle())
            
            
            HStack {
                
//                //制作报告
//                Button(action: {
//                    guard let selectedElement = self.userData.selectedElement else {
//                        return self.userData.saveReport()
//                    }
//                    self.userData.saveReport(selectedElement)
//                    //self.userData.saveReport()
//                }) {
//                    Text("S")
//                }
                
                TextField("Add " + "\(GeneralElement.self)", text: $newName)
                Button(action: {self.userData.addElement(self.newName)}) {Text("Add")}
            }
            //.padding()
            
        }
            //.frame(minWidth: 225, maxWidth: 300)
    }
}

struct NavigationPrimary_Previews: PreviewProvider {
    static var previews: some View {
        let userData = UserData<EvalIndicator>()
        return NavigationPrimary<EvalIndicator>().environmentObject(userData)
    }
}
