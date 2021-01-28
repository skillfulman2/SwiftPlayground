//
//  AboutView.swift
//  Bullseye
//
//  Created by Ryan Remaly on 1/5/20.
//  Copyright © 2020 Ryan Remaly. All rights reserved.
//

import SwiftUI

struct AboutView: View {
    
    let beige = Color(red: 255.0/255.0, green: 214.0/255.0, blue: 179.0/255.0)
    
    struct HeadingStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
            .foregroundColor(Color.black)
            .font(Font.custom("ArialRoundedMTBold", size: 30))
            .padding(.bottom, 20)
            .padding(.top, 20)
        }
    }
    
    struct TextStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
            .foregroundColor(Color.black)
            .font(Font.custom("ArialRoundedMTBold", size: 16))
                .padding(.leading, 60)
                .padding(.trailing, 60)
                .padding(.bottom, 20)
        }
    }
    
    
    var body: some View {
        Group {
            VStack{
            Text("🎯 Bullseye 🎯").modifier(HeadingStyle())
                
                Text("This is bullseye, the game where you can win points and earn fame by dragging a slider").modifier(TextStyle())
                Text("Your goal is to place the slider as close as possible to the target value. The closer you are, the more points you score.").modifier(TextStyle())
                Text("Enjoy!").modifier(TextStyle())
                
            }
        .navigationBarTitle("About Bullseye")
        .background(beige)
        }
    
    .background(Image("Background"))
}
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView().previewLayout(.fixed(width: 896, height: 414))
    }
}


