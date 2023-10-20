//
//  SignupView4.swift
//  PromPlanner
//
//  Created by Chirag Shah on 2023-03-29.
//

import SwiftUI

struct SignupView4: View {
    @State var HealthConcerns: String = ""
    @State var Allergies: String = ""
    @State private var leftArrowClicked: Bool? = nil

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
                .padding(.top, 30)
                .padding(.leading,10)
                Spacer(minLength: 30)
                VStack(alignment: .center) {
                    Text("Create Account")
                        .font(.custom("MontserratRoman-Regular", size: 35))
                        .foregroundColor(Color.black)
                        .padding(.bottom, 15)
                    Text("Remember, health and safety first")
                        .font(.custom("MontserratRoman-ExtraLight", size: 20))
                        .padding(.bottom, 30)
                        .foregroundColor(Color.black)
                    
                    VStack {
                        TextField("", text: self.$HealthConcerns, prompt: Text("School Health Concerns")
                            .foregroundColor(.black.opacity(0.9))
                            .font(.custom("SourceSansPro-ExtraLight", size: 22)))
                            .padding(.leading, 15)
                            .padding(.top, -60)
                            .frame(height: 170)
                            .textFieldStyle(PlainTextFieldStyle())
                            .padding([.horizontal], 4)
                            .background(Color("textfieldgray"))
                            .cornerRadius(16)
                            .padding([.horizontal], 24)
                            .padding(.bottom, 20)
                        
                        TextField("", text: self.$Allergies, prompt: Text("Allergies & Dietary Restrictions")
                            .foregroundColor(.black.opacity(0.9))
                            .font(.custom("SourceSansPro-ExtraLight", size: 22)))
                            .padding(.leading, 15)
                            .padding(.top, -40)
                            .frame(height: 140)
                            .textFieldStyle(PlainTextFieldStyle())
                            .padding([.horizontal], 4)
                            .background(Color("textfieldgray"))
                            .cornerRadius(16)
                            .padding([.horizontal], 24)
                            .padding(.bottom, 55)
                        
                        NavigationLink(
                            destination: HomeView1().navigationBarBackButtonHidden(true),
                            tag: true,
                            selection: $leftArrowClicked,
                            label: {
                                Text("Create Account")
                                    .foregroundColor(.white)
                                    .frame(width: 330, height: 30)
                                    
                                    .font(.custom("SourceSansPro-SemiBold", size: 25))
                                    
                                    
                                    .padding(.top, 10)
                                    .padding(.bottom, 10)
                                    
                                    .background(Color("Pink1"))
                                    .cornerRadius(15)
                            }
                        )
                        
                        
                        Spacer()
                        Spacer()
                        Spacer()
                        HStack {
                            NavigationLink(
                                destination: SignupView3().navigationBarBackButtonHidden(true),
                                tag: true,
                                selection: $leftArrowClicked,
                                label: {
                                    Image("leftarrow")
                                        .resizable()
                                        .frame(width: 65, height: 55)
                                        .padding(.leading, 5)
                                }
                            )
                            
                            Rectangle()
                                .fill(Color("RectangleBlack"))
                                .frame(width: 240, height: 10)
                        }
                        .position(x: 195, y: 50)
                    }
                    Spacer(minLength: 100)
                }
            }
        }
    }
}



struct SignupView4_Previews: PreviewProvider {
    static var previews: some View {
        SignupView4()
    }
}
