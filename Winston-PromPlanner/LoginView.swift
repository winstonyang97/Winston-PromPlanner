//
//  LoginView.swift
//  PromPlanner
//
//  Created by Chirag Shah on 2023-03-23.
//

import SwiftUI

struct LoginView: View {
    @State var email: String = ""
    @State var password: String = ""
    var body: some View {
        VStack {
            HStack {
                Rectangle()
                    .fill(Color.black)
                    .frame(width: 105, height: 10)
                Image("Logomain")
                    .resizable()
                    .frame(width: 95, height: 68)
                Rectangle()
                    .fill(Color.black)
                    .frame(width: 105, height: 10)
                
            }
            .padding(.leading)
            Spacer()
            VStack(alignment: .center) {
                
                Text("no")

                Text("Welcome to")
                    .font(.custom("MontserratRoman-Light", size: 40))
                    .foregroundColor(Color.black)
                
                Text("Prom Planner")
                    .font(.custom("MontserratRoman-Bold", size: 40))
                    .foregroundColor(Color("Pink1"))
                VStack {
                    TextField("", text: self.$email, prompt: Text("Email").foregroundColor(.black.opacity(0.9)).font(.custom("MontserratRoman-Light", size: 22)))
                        .padding(.leading, 15)
                        .frame(height: 58)
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding([.horizontal], 4)
                        .background(Color("textfieldgray"))
                        .cornerRadius(16)
                        .padding([.horizontal], 24)
                        .padding(.bottom, 20)
                    TextField("", text: self.$password, prompt: Text("Password").foregroundColor(.black.opacity(0.9)).font(.custom("MontserratRoman-Light", size: 22)))
                        .padding(.leading, 15)
                        .frame(height: 58)
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding([.horizontal], 4)
                        .background(Color("textfieldgray"))
                        .cornerRadius(16)
                        .padding([.horizontal], 24)
                        .padding(.bottom, 20)
                    Button {
                        print("Image tapped!")
                    } label: {
                        Text("Sign In")
                    }
                    .padding()
                    
                    .frame(width: 330, height: 55)
                    .background(Color("Pink1"))
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .fontWeight(.bold)
                    .font(.custom("MontserratRoman-Regular", size: 25))
                        
                }
                .padding(.leading, 20)
                
                
                
                
                
                    
                    
            }
            Spacer()
            Spacer()
            Spacer()

                
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)


    }
    init() {
        for familyName in UIFont.familyNames {
            print(familyName)
            for fontName in UIFont.fontNames(forFamilyName: familyName) {
                print("-- \(fontName)")
            }
                    
        }
    }
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
