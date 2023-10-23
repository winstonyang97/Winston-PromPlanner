//
//  EventDetailView.swift
//  PromPlanner
//
//  Created by Chirag Shah on 2023-04-18.
//

import SwiftUI

struct EventDetailView: View {

    var body: some View {
        VStack {
            //HeaderView()
            Spacer(minLength: 60)
            VStack {
                EventsTextView(Text1: "Event Name")
                Text("00/00/20xx")
                    .font(.custom("MontserratRoman-Regular", size: 25))
                    .foregroundColor(Color("Pink1"))
            }
            Spacer(minLength: 210)
            BannerView()
            VStack {
                Spacer()
                EventDescriptionTextView(Text1: "Here lies the description for the event! Extra information can also be found here!")
                    .position(x: 145, y: -80)
                    .frame(width: 280)
                VStack {
                    Spacer()
                    HStack {
                        Text("Events")
                            .font(.custom("MontserratRoman-Light", size: 25))
                            .foregroundColor(Color("Pink1"))
                        Rectangle()
                            .fill(Color("Pink1"))
                            .frame(width: 220, height: 2)
                            .ignoresSafeArea(.all)
                    }
                    .padding(.leading, 75)
                    .position(x: 180, y: -145)
                    VStack {
                        Spacer()
                        RulesView(Rule1: "Rule number one", Rule2: "Rule number two", Rule3: "Rule number three")
                            .position(x: 256, y: -150)
                        Spacer()
                        Button(action: {
                            // Add the action you want the button to perform here
                        }) {
                            Text("Contact Supervisor")
                                .font(.custom("SourceSansPro-Regular", size: 22))
                                .foregroundColor(.white)
                                .padding(.horizontal, 40) // add padding to make the button wider
                                .padding(.vertical, 14)
                                .background(Color("Pink1"))
                                .cornerRadius(10)
                        }
                        .position(x: 190, y: -20)
                    }
                    Button(action: {
                        
                    }, label: {
                        Image("leftarrow")
                            .resizable()
                            .frame(width: 60, height: 45)
                            .padding(.bottom, -25)
                            .padding(.trailing, 220)
                    })
                    
                }
            }
                    
            
        }
        
    }
}








struct EventDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EventDetailView()
    }
}

struct BannerView: View {
    @State private var selectedImageIndex = 0
    let images = ["Paris", "waterfall", "portugal"]
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color("Pink1"))
                .frame(width: 400, height: 230)
                .ignoresSafeArea(.all)
            Image(images[selectedImageIndex])
                .resizable()
                .scaledToFit()
                .frame(width: 300)
                .padding(.top, 90)
                .padding(.leading, -2)
                .padding(.bottom, 110)
            
            
            HStack {
                ForEach(0..<3) { index in
                    Circle()
                        .fill(selectedImageIndex == index ? Color.white : Color("circle"))
                        .frame(width: 12, height: 12)
                        .overlay(
                            Circle()
                                .stroke(Color.white, lineWidth: 2)
                        )
                        .padding(.horizontal, 5)
                        .onTapGesture {
                            selectedImageIndex = index
                        }
                }
            }
            .padding(.top, 20)
            .position(x: 200, y:360)
        }
        .padding(.top, -350)
    }
}


struct EventDescriptionTextView: View {
    var Text1: String
    var body: some View {
        Text(Text1)
        
            .font(.custom("MontserratRoman-Light", size: 20))
            .foregroundColor(Color("RectangleBlack"))
            .padding(.top, -55)
        
    }
}


struct RulesView: View {
    var Rule1: String
    var Rule2: String
    var Rule3: String
    
    var body: some View {
        VStack {
            VStack {
                Text("1. \(Rule1)")
                    .font(.custom("MontserratRoman-Light", size: 22))
                    .padding(.bottom, -5)
                Text("2. \(Rule2)")
                    .font(.custom("MontserratRoman-Light", size: 22))
                    .padding(.bottom, -5)
                    .padding(.leading, 2)
                Text("3. \(Rule3)")
                    .font(.custom("MontserratRoman-Light", size: 22))
                    .padding(.leading, 20)
            }
            .padding(.top, 90)
            .padding(.leading, -180)
            
        }
    }
}
