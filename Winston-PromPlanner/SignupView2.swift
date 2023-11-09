//
//  SignupView2.swift
//  PromPlanner
//
//  Created by Chirag Shah on 2023-03-27.
//

import SwiftUI

struct SignupView2: View {
    @State var username: String = ""
    @State var password: String = ""
    @State var confirmation: String = ""
    @State private var showRandomView = false
    @State private var errorMessage: String?
    @State var showAlert: Bool = false
    
    @Environment(\.presentationMode) var presentationMode
    
    
    var firstName: String
    var lastName: String
    
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
                    Text("Hello \(firstName) \(lastName), let’s create an account")
                        .font(.custom("MontserratRoman-ExtraLight", size: 20))
                        .padding(.bottom, 35)
                        .foregroundColor(Color.black)
                    
                        .multilineTextAlignment(.center)
                    Spacer()
                    VStack {
                        TextField("", text: self.$username, prompt: Text("Username").foregroundColor(.black.opacity(0.9)).font(.custom("SourceSansPro-ExtraLight", size: 22)))
                            .padding(.leading, 15)
                            .frame(height: 58)
                            .textFieldStyle(PlainTextFieldStyle())
                            .padding([.horizontal], 4)
                            .background(Color("textfieldgray"))
                            .cornerRadius(16)
                            .padding([.horizontal], 24)
                            .padding(.bottom, 20)
                        SecureField("", text: self.$password, prompt: Text("Password").foregroundColor(.black.opacity(0.9)).font(.custom("SourceSansPro-ExtraLight", size: 22)))
                            .padding(.leading, 15)
                            .frame(height: 58)
                            .textFieldStyle(PlainTextFieldStyle())
                            .padding([.horizontal], 4)
                            .background(Color("textfieldgray"))
                            .cornerRadius(16)
                            .padding([.horizontal], 24)
                            .padding(.bottom, 20)
                        SecureField("", text: self.$confirmation, prompt: Text("Confirm Password").foregroundColor(.black.opacity(0.9)).font(.custom("SourceSansPro-ExtraLight", size: 22)))
                            .padding(.leading, 15)
                            .frame(height: 58)
                            .textFieldStyle(PlainTextFieldStyle())
                            .padding([.horizontal], 4)
                            .background(Color("textfieldgray"))
                            .cornerRadius(16)
                            .padding([.horizontal], 24)
                            .padding(.bottom, 20)
                        HStack {
                            Button(action: {
                                self.presentationMode.wrappedValue.dismiss()
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
                                destination: SignupView3().navigationBarBackButtonHidden(true),
                                isActive: $showRandomView) {
                                Button(action: {
                                    if username.isEmpty || password.isEmpty {
                                        errorMessage = "Empty fields. Please fix."
                                        self.showAlert = true
                                    } else if password != confirmation {
                                        errorMessage = "Wrong values."
                                        self.showAlert = true
                                    } else {
                                        showRandomView = true
                                        self.showAlert = false
                                    }
                                    
                                }, label: {
                                    Image("rightarrow")
                                        .resizable()
                                        .frame(width: 65, height: 55)
                                        .padding(.leading, 5)
                                })
                                .alert(isPresented: $showAlert) {
                                    if let errorMessage = errorMessage {
                                        return Alert(title: Text("Error"), message: Text(errorMessage), dismissButton: .default(Text("OK")))
                                    } else {
                                        return Alert(title: Text("Error"), message: Text("Unknown error."), dismissButton: .default(Text("OK")))
                                    }
                                }
                            }
                        }
                        .position(x: 195, y:177)
                        
                        
                        
                        Spacer()
                        Spacer()
                        Spacer()
                    }
                }
            }
        }
    }
}
    
struct SignupView2_Previews: PreviewProvider {
    static var previews: some View {
        SignupView2(firstName: "John", lastName: "Doe")
    }
}
