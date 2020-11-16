//
//  ElementRow.swift
//  FixHospitalPosts
//
//  Created by jk on 2020/7/18.
//  Copyright © 2020 ssl. All rights reserved.
//

import SwiftUI

struct ElementRow<GeneralElement: NamedEntity>: View {
    var element: GeneralElement
    
    var body: some View {
        
        HStack(alignment: .center, spacing:12) {
            Text(element.name)
                .fontWeight(.bold)
                .truncationMode(.tail)
                .frame(minWidth: 20)
            
            Spacer()
            
            if element.favor {
                Image("star-filled")
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(.green)
                    .frame(width: 10, height: 10)
            }            
        }
        //.padding(.vertical,4)
    }
}

