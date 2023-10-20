//
//  SignupView3.swift
//  PromPlanner
//
//  Created by Chirag Shah on 2023-03-29.
//

import SwiftUI

struct SignupView3: View {
    @State var schoolName: String = ""
    @State var Country: String = ""
    @State var State: String = ""
    @State var Grade: String = ""
    @State private var rightArrowClicked: Bool? = nil
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Rectangle()
                        .fill(Color("RectangleBlack"))
                        .frame(width: 105, height: 10)
                    Image("Logomain")
                        .resizable()
                        .frame(width: 95, height: 68)
                    Rectangle()
                        .fill(Color("RectangleBlack"))
                        .frame(width: 105, height: 10)
                    
                }
                .padding(.leading)
                Spacer(minLength: 80)
                VStack(alignment: .center) {
                    
                    Text("Create Account")
                        .font(.custom("MontserratRoman-Regular", size: 35))
                        .foregroundColor(Color.black)
                        .padding(.bottom, 5)
                    Text("Connect your account to a school")
                        .font(.custom("MontserratRoman-ExtraLight", size: 20))
                        .padding(.bottom, 10)
                        .foregroundColor(Color.black)
                    
                    VStack {
                        TextField("", text: self.$schoolName, prompt: Text("School Name").foregroundColor(.black.opacity(0.9)).font(.custom("SourceSansPro-ExtraLight", size: 22)))
                            .padding(.leading, 15)
                            .frame(height: 58)
                            .textFieldStyle(PlainTextFieldStyle())
                            .padding([.horizontal], 4)
                            .background(Color("textfieldgray"))
                            .cornerRadius(16)
                            .padding([.horizontal], 24)
                            .padding(.bottom, 20)
                        TextField("", text: self.$Country, prompt: Text("Country").foregroundColor(.black.opacity(0.9)).font(.custom("SourceSansPro-ExtraLight", size: 22)))
                            .padding(.leading, 15)
                            .frame(height: 58)
                            .textFieldStyle(PlainTextFieldStyle())
                            .padding([.horizontal], 4)
                            .background(Color("textfieldgray"))
                            .cornerRadius(16)
                            .padding([.horizontal], 24)
                            .padding(.bottom, 20)
                        TextField("", text: self.$State, prompt: Text("State/Province").foregroundColor(.black.opacity(0.9)).font(.custom("SourceSansPro-ExtraLight", size: 22)))
                            .padding(.leading, 15)
                            .frame(height: 58)
                            .textFieldStyle(PlainTextFieldStyle())
                            .padding([.horizontal], 4)
                            .background(Color("textfieldgray"))
                            .cornerRadius(16)
                            .padding([.horizontal], 24)
                            .padding(.bottom, 20)
                        TextField("", text: self.$Grade, prompt: Text("Grade").foregroundColor(.black.opacity(0.9)).font(.custom("SourceSansPro-ExtraLight", size: 22)))
                            .padding(.leading, 15)
                            .frame(height: 58)
                            .textFieldStyle(PlainTextFieldStyle())
                            .padding([.horizontal], 4)
                            .background(Color("textfieldgray"))
                            .cornerRadius(16)
                            .padding([.horizontal], 24)
                            .padding(.bottom, 20)
                        Spacer()
                        Spacer()
                        Spacer()
                        HStack {
                            Button(action: {
                                print("Left button tapped")
                            }, label: {
                                Image("leftarrow")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .padding(.trailing, 18)
                            })
                            Rectangle()
                                .fill(Color("RectangleBlack"))
                                .frame(width: 140, height: 10)
                            NavigationLink(
                                destination: SignupView4().navigationBarBackButtonHidden(true),
                                tag: true,
                                selection: $rightArrowClicked,
                                label: {
                                    Image("rightarrow")
                                        .resizable()
                                        .frame(width: 65, height: 55)
                                        .padding(.leading, 5)
                                }
                            )
                            
                            
                        }
                        .position(x: 195, y: 130)

                        
                    }
                    Spacer(minLength: 100)
                }
            }
        }
        
    }
}


struct SignupView3_Previews: PreviewProvider {
    static var previews: some View {
        SignupView3()
    }
}
