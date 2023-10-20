//
//  EditView3.swift
//  PromPlanner
//
//  Created by Chirag Shah on 2023-05-03.
//

import SwiftUI

struct EditView3: View {
    @State var HealthConcerns: String = ""
    @State var Allergies: String = ""
    @State var rightArrowClicked:Bool?=nil
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
                Spacer(minLength: 10)
                Text("Edit Account")
                    .padding(.top, -100)
                    .font(.custom("MontserratRoman-Light", size: 40))
                    .foregroundColor(Color.black)
                    .padding(.leading, -15)
                VStack {
                    TextField("", text: self.$HealthConcerns, prompt: Text("School Health Concerns")
                        .foregroundColor(.black.opacity(0.9))
                        .font(.custom("SourceSansPro-ExtraLight", size: 22)))
                    .padding(.leading, 15)
                    .padding(.top, -40)
                    .frame(height: 145)
                    .textFieldStyle(PlainTextFieldStyle())
                    .padding([.horizontal], 4)
                    .background(Color("textfieldgray"))
                    .cornerRadius(16)
                    .padding(.top, -45)
                    .padding([.horizontal], 35)
                    .padding(.bottom, 25)
                    
                    TextField("", text: self.$Allergies, prompt: Text("Allergies & Dietary Restrictions")
                        .foregroundColor(.black.opacity(0.9))
                        .font(.custom("SourceSansPro-ExtraLight", size: 22)))
                    .padding(.leading, 15)
                    .padding(.top, -40)
                    .frame(height: 135)
                    .textFieldStyle(PlainTextFieldStyle())
                    .padding([.horizontal], 4)
                    .background(Color("textfieldgray"))
                    .cornerRadius(16)
                    .padding([.horizontal], 35)
                    .padding(.bottom, 30)
                    
                    
                    Button(action: {
                        print("Left button tapped")
                    }, label: {
                        Text("Confirm Changes")
                            .foregroundColor(.white)
                            .frame(width: 330, height: 30)
                        
                            .font(.custom("SourceSansPro-SemiBold", size: 25))
                        
                        
                            .padding(.top, 15)
                            .padding(.bottom, 20)
                        
                            .background(Color("Pink1"))
                            .cornerRadius(15)
                        
                    })
                    
                    
                    HStack {
                        NavigationLink(
                            destination: EditView2().navigationBarBackButtonHidden(true),
                            tag: true,
                            selection: $rightArrowClicked,
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
                    .padding(.top, 100)
                    .padding(.bottom, -130)
                    
                }.padding(.bottom, 140)
            }
        }
    }
}
struct EditView3_Previews: PreviewProvider {
    static var previews: some View {
        EditView3()
    }
}
