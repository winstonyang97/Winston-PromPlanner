//
//  SignupView2.swift
//  PromPlanner
//
//  Created by Chirag Shah on 2023-03-27.
//

import SwiftUI

struct SecureTextField2: View {
    @State private var isSecureField: Bool = true
    @Binding var text: String
    @State private var showWarning = false
   
    
    
    var body: some View {
        
        HStack {
            Spacer()
                .navigationBarBackButtonHidden()
            if isSecureField {
                SecureField("", text: self.$text, prompt: Text("Password").foregroundColor(.black.opacity(0.9)).font(.custom("SourceSansPro-ExtraLight", size: 22)))
            } else {
                TextField(text, text: $text)
               
            }
        }.overlay(alignment: .trailing) {
            Image(systemName: isSecureField ? "eye.slash": "eye")
                .onTapGesture {
                    isSecureField.toggle()
                }
        }
        if showWarning {
            Text("Please fill in all fields")
                .foregroundColor(.red)
        }
    }
}

struct SecureTextField3: View {
    @State private var isSecureField: Bool = true
    @Binding var text2: String
    @State private var showWarning = false
   
    
    
    var body: some View {
        
        HStack {
            Spacer()
                .navigationBarBackButtonHidden()
            if isSecureField {
                SecureField("", text: self.$text2, prompt: Text("Confirm Password").foregroundColor(.black.opacity(0.9)).font(.custom("SourceSansPro-ExtraLight", size: 22)))
            } else {
                TextField(text2, text: $text2)
               
            }
        }.overlay(alignment: .trailing) {
            Image(systemName: isSecureField ? "eye.slash": "eye")
                .onTapGesture {
                    isSecureField.toggle()
                }
        }
        if showWarning {
            Text("Please fill in all fields")
                .foregroundColor(.red)
        }
    }
}

struct SignupView2: View {
    class NavigationManager: ObservableObject {
        @Published var isNavigationActiveToSignupView = false
        @Published var isNavigationActiveToSignupView3 = false
    }
    @State var username: String = ""
    @State var password: String = ""
    @State var confirmation: String = ""
    @State private var showRandomView = false
    @State private var errorMessage: String?
    @State var showAlert: Bool = false
    @State private var showWarning = false
    @State private var showWarning2 = false
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var navigationManager = NavigationManager()
    @State private var isSignupView = false
    @State private var isPasswordMatch = true
    
    @Environment(\.presentationMode) var presentationMode
    
    
    var firstName: String
    var lastName: String
    
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
                        TextField("", text: self.$username, prompt: Text(" Username").foregroundColor(.black.opacity(0.9)).font(.custom("SourceSansPro-ExtraLight", size: 22)))
                            .autocapitalization(.none)
                            .padding(.leading, 15)
                            .frame(height: 58)
                            .textFieldStyle(PlainTextFieldStyle())
                            .padding([.horizontal], 4)
                            .background(Color("textfieldgray"))
                            .cornerRadius(16)
                            .padding([.horizontal], 24)
                            .padding(.bottom, 20)
                        SecureTextField2(text: $password)
                            .padding(.leading, 15)
                            .frame(height: 58)
                            .textFieldStyle(PlainTextFieldStyle())
                            .padding([.horizontal], 4)
                            .background(Color("textfieldgray"))
                            .cornerRadius(16)
                            .padding([.horizontal], 24)
                            .padding(.bottom, 20)
                        SecureTextField3(text2: $confirmation)
                            .padding(.leading, 15)
                            .frame(height: 58)
                            .textFieldStyle(PlainTextFieldStyle())
                            .padding([.horizontal], 4)
                            .background(Color("textfieldgray"))
                            .cornerRadius(16)
                            .padding([.horizontal], 24)
                            .padding(.bottom, 20)
                        
                        VStack {
                            Spacer()
                            if showWarning {
                                Text("Please fill in all fields")
                                    .foregroundColor(.red)
                            }
                            
                            if showWarning2 {
                                Text("Passwords do not match, please try again")
                                    .foregroundColor(.red)
                            }
                            HStack {
                                Spacer()
                                Button(action: {dismiss()
                                    
                                   
                                    isSignupView = true
                                }) {
                                    Image(systemName: "chevron.left")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                        .foregroundColor(Color("Pink1"))
                                    
                                    
                                }
                                /*.background(
                                    NavigationLink("", destination: SignupView(), isActive: $isSignupView)
                                        .opacity(0)
                                )*/
                                
                                
                                
                                
                                
                                
                                .environmentObject(navigationManager)
                                .navigationBarBackButtonHidden(true)
                                Spacer()
                                
                                Button(action: {
                                    if username.isEmpty || password.isEmpty || confirmation.isEmpty {
                                        print("User input is null or empty")
                                        showWarning = true
                                        showWarning2 = false
                                        
                                        
                                    } else if password != confirmation {
                                        showWarning2 = true
                                        showWarning = false
                                        print("The password do not match")
                                    } else {
                                        showWarning = false
                                        showWarning2 = false
                                        print("User input is not null")
                                        navigationManager.isNavigationActiveToSignupView3 = true
                                    }}) {
                                        Image(systemName: "chevron.right")
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                            .foregroundColor(Color("Pink1"))
                                        
                                    }
                                    .background(
                                        NavigationLink("", destination: SignupView3(), isActive: $navigationManager.isNavigationActiveToSignupView3)
                                            .opacity(0)
                                    )
                                
                                    .environmentObject(navigationManager)
                                    .navigationBarBackButtonHidden(true)
                                Spacer()
                                
                            }
                            Spacer()
                            Spacer()
                        }
                        
                        
                        
                        
                        
                        
                        
                        
                      /*  HStack {
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
                        .position(x: 195, y:177)*/
                        
                        
                        
                        Spacer()
                        Spacer()
                        Spacer()
                    }
                }
            }
        }
    }
//}
    
struct SignupView2_Previews: PreviewProvider {
    static var previews: some View {
        SignupView2(firstName: "John", lastName: "Doe")
    }
}
