//
//  PollView.swift
//  Bullseye
//
//  Created by Ryan Remaly on 11/24/20.
//  Copyright © 2020 Ryan Remaly. All rights reserved.
//

import SwiftUI

struct PollView: View {
    var body: some View {
        GeometryReader { bounds in
            VStack(alignment: .center) {
                
                RoundedRectangle(cornerRadius: 16)
                    .frame( height: bounds.size.height / 1000, alignment: .center)
                    
                    .foregroundColor(.clear)
                
                
                RoundedRectangle(cornerRadius: 16)
                    .frame(width: bounds.size.width / 1.1, height: bounds.size.height / 10, alignment: .center)
                
                
                
            }
        }
        
    }
}

struct PollView_Previews: PreviewProvider {
    static var previews: some View {
        PollView()
    }
}
