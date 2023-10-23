//
//  SignupView4.swift
//  PromPlanner
//
//  Created by Chirag Shah on 2023-03-29.
//

import SwiftUI

struct SignupView4: View {
    class NavigationManager: ObservableObject {
        @Published var isNavigationActiveToSignupView3 = false
        @Published var isNavigationActiveToHomeView1 = false
    }
    @State var HealthConcerns: String = ""
    @State var Allergies: String = ""
    @State private var leftArrowClicked: Bool? = nil
    @ObservedObject var navigationManager = NavigationManager()
    @State private var showWarning = false
    @Environment(\.dismiss) private var dismiss
    @State private var isSignupView3 = false

    var body: some View {
        //NavigationView {
            VStack {
                Spacer()
                    .navigationBarBackButtonHidden()
                HStack {
                    Rectangle()
                        .fill(Color.black)
                        .frame(width: 105, height: 5)
                    Image("promplannerlogomain")
                        .resizable()
                        .frame(width: 95, height: 68)
                    Rectangle()
                        .fill(Color.black)
                        .frame(width: 105, height: 5)
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
                        .padding(.bottom, 15)
                        
                        Button(action: {
                            dismiss()
                            isSignupView3 = true
                        }) {
                            Text("Go Back")
                                .frame(width: 330, height: 50)
                                .background(Color("Pink1"))
                                .foregroundColor(.white)
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                                .fontWeight(.bold)
                                .font(.custom("MontserratRoman-Regular", size: 25))
                            
                            
                        
                    }

                        Spacer(minLength: 80)
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
                        
                        
                        
                        /*HStack {
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
                         
                         }*/
                        //.position(x: 195, y: 50)
                    }
                    Spacer(minLength: 40)
                }

            }
        
        }
    }
//}



struct SignupView4_Previews: PreviewProvider {
    static var previews: some View {
        SignupView4()
    }
}
