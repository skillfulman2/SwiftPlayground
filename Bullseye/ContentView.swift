    //
    //  ContentView.swift
    //  Bullseye
    //
    //  Created by Ryan Remaly on 12/30/19.
    //  Copyright © 2019 Ryan Remaly. All rights reserved.
    //

    import SwiftUI

    struct ContentView: View {

    @State var alertIsVisible = false
    @State var sliderValue = 50.0
    @State var target = Int.random(in: 1...100)
    @State var totalScore = 0
    @State var round = 1
    
    
     let midnightBlue = Color(red: 0.0/255.0, green: 51/255.0, blue: 102.0/255.0)
        
        struct LabelStyle: ViewModifier {
            func body(content: Content) -> some View {
                return content
                .foregroundColor(Color.white)
                .modifier(Shadow())
                .font(Font.custom("ArialRoundedMTBold", size: 18))
            }
        }
        
        struct ValueStyle: ViewModifier {
            func body(content: Content) -> some View {
                return content
                .foregroundColor(Color.yellow)
                .modifier(Shadow())
                .font(Font.custom("ArialRoundedMTBold", size: 24))
            }
        }
        
        struct Shadow: ViewModifier {
            func body(content: Content) -> some View {
                return content
                .shadow(color: Color.black, radius: 5, x: 2, y: 2)
                
            }
        }
        
        struct ButtonLargeTextStyle: ViewModifier {
            func body(content: Content) -> some View {
                return content
                .foregroundColor(Color.black)
                .font(Font.custom("ArialRoundedMTBold", size: 18))
            }
        }
        
        struct ButtonSmallTextStyle: ViewModifier {
            func body(content: Content) -> some View {
                return content
                .foregroundColor(Color.black)
                .font(Font.custom("ArialRoundedMTBold", size: 12))
            }
        }


    var body: some View {
    VStack {
        Spacer()
        // Target row
        HStack {
            Text("Put the bullseye as close as you can to: ").modifier(LabelStyle())
            Text("\(target)").modifier(ValueStyle())
                
        }
        Spacer()
        
        // Slider row
        HStack{
            Text("1").modifier(LabelStyle())
            Slider(value: $sliderValue, in: 1...100).accentColor(Color.green)
            Text("100").modifier(LabelStyle())
        }
        
        Spacer()
        
        // Button row
        HStack {
        Button(action: {
            self.alertIsVisible = true
            
            
        }) {
            Text("Hit me!").modifier(ButtonLargeTextStyle())
        }
            
                
            .alert(isPresented: $alertIsVisible) { () ->
               
            Alert in
                return Alert(title: Text("\(betterAlert())"), message: Text("The slider's value is \(sliderValueRounded()).\n" +
                    "You scored \(pointsForCurrentRound()) points this round."), dismissButton: .default(Text("Awesome!")){
                        self.totalScore = self.totalScore + self.pointsForCurrentRound()
                        self.target = Int.random(in: 1...100)
                        self.round += 1
                        
                        
                    })
                
                
        }
        .background(Image("Button")).modifier(Shadow())
            
            
        }
        
        Spacer()
        
        
        // Score row
        
        HStack{
        Button(action: {
            //self.alertIsVisible = true
            self.resetGame()
        }) {
            HStack {
            Image("StartOverIcon")
            Text("Start Over").modifier(ButtonSmallTextStyle())
            }
        }
            .background(Image("Button")).modifier(Shadow())
            Spacer()
            Text("Score:").modifier(LabelStyle())
            Text("\(totalScore)").modifier(ValueStyle())
            Spacer()
            Text("Round").modifier(LabelStyle())
            Text("\(round)").modifier(ValueStyle())
            Spacer()
            
            NavigationLink(destination: AboutView()) {
                HStack {
                Image("InfoIcon")
                Text("Info").modifier(ButtonSmallTextStyle())
                }
            }
            .background(Image("Button")).modifier(Shadow())
            
        }
        .padding(.bottom, 20)
        
        }
    .background(Image("Background"), alignment: .center)
    .accentColor(midnightBlue)
    .navigationBarTitle("Bullseye")
    }
        
        func pointsForCurrentRound() -> Int {
            let maximumScore = 100
            let difference = amountOff()
            let bonus: Int
            if difference == 0 {
                bonus = 100
            } else if difference == 1 {
                bonus = 50
            } else {
                bonus = 0
            }
            
            return maximumScore - difference + bonus
        }
        
        func amountOff() -> Int {
           return abs(target - sliderValueRounded())
        }
        
        func resetGame() {
            totalScore = 0
            round = 1
            sliderValue = 50.0
            target = Int.random(in: 1...100)
            
        }
        
        func sliderValueRounded() -> Int {
            return Int(sliderValue.rounded())
            
        }
        
        func betterAlert() -> String {
            let difference = amountOff()
            let title: String
            
            if difference == 0 {
                title = "Perfect!"
            } else if difference < 5 {
                title = "You almost had it!"
            } else if difference <= 10 {
                title = "Not bad."
            } else {
                title = "Were you even trying?"
            }
            
            return title
            
        }

    struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height: 414))
    }
    }
    
    }
    
    
