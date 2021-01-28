//
//  Leaderboard.swift
//  Bullseye
//
//  Created by Ryan Remaly on 1/27/21.
//  Copyright © 2021 Ryan Remaly. All rights reserved.
//

import SwiftUI

struct Leaderboard: View {
    var body: some View {
        
        GeometryReader { bounds in
            ZStack {
                VStack {
                    // this is where i can place a cool leaderboard view
                    Rectangle()
                        .frame(width: bounds.size.width, height: bounds.size.height / 1.6, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    Spacer()
                }
                .frame(width: bounds.size.width, height: bounds.size.height, alignment: .center)
                
                
                
                VStack (spacing: 0) {
                    Spacer()
                    ZStack {
                        RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/).foregroundColor(.white)
                            .frame(width: bounds.size.width, height: bounds.size.height / 1.7, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        ScrollView (showsIndicators: false) {
                          
                                ForEach(userArray, id: \.self) { user in
                                    ExtractedView(width: bounds.size.width, height: bounds.size.height)
                                        .padding(.top,2)
                                }
                                .padding(.top, 7)
                                .padding(.bottom, 7)
                                
                        }
                        //.clipShape(Circle())
                        .clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/))
                                    
                        .frame(width: bounds.size.width, height: bounds.size.height / 1.7, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        
                        
                    }

                }
                
            }
            .frame(width: bounds.size.width, height: bounds.size.height, alignment: .center)
            
        }
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        
    }
}

struct Leaderboard_Previews: PreviewProvider {
    static var previews: some View {
        Leaderboard()
    }
}


struct user: Hashable {
    
    var avatar: Int?
    var name: String?
    var time: Double?
    
    init(avatar: Int, name: String, time: Double) {
        self.avatar = avatar;
        self.name = name;
        self.time = time;
    }
    
    
}

var avatarArray = [Image("0"),Image("1"), Image("2"),Image("3"),Image("4"),Image("5"),Image("6"), Image("7")]
var userArray = [user(avatar: 2, name: "Bob", time: 22.48), user(avatar: 0, name: "Bill", time: 92.48), user(avatar: 5, name: "Jimmy", time: 52.5), user(avatar: 6, name: "Ryan", time: 32.48), user(avatar: 2, name: "Scooter", time: 32.48), user(avatar: 7, name: "Drake", time: 29.48), user(avatar: 3, name: "Weezy", time: 12.48), user(avatar: 1, name: "Jill", time: 25.48), user(avatar: 2, name: "Mary", time: 72.48), user(avatar: 2, name: "Bob", time: 22.48), user(avatar: 0, name: "Bill", time: 92.48), user(avatar: 5, name: "Jimmy", time: 52.5), user(avatar: 6, name: "Ryan", time: 32.48), user(avatar: 2, name: "Scooter", time: 32.48), user(avatar: 7, name: "Drake", time: 29.48), user(avatar: 3, name: "Weezy", time: 12.48), user(avatar: 1, name: "Jill", time: 25.48), user(avatar: 2, name: "Mary", time: 72.48)]

struct ExtractedView: View {
    
    var width: CGFloat
    var height: CGFloat
    
    init(width: CGFloat, height: CGFloat) {
        self.width = width
        self.height = height
    }
    
    var body: some View {
            HStack {
                Text("Hello")
            }
            .frame(width: self.width / 1.02, height: self.height / 10, alignment: .center)
            .background(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/, style: .continuous).foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/))
        
    }
}



