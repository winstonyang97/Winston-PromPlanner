//
//  LoginView.swift
//  PromPlanner
//
//  Created by Chirag Shah on 2023-03-23.
// Actually I did all the work on 2023-10-7
//

import SwiftUI



struct SecureTextField: View {
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




struct LoginView: View {
    class NavigationManager: ObservableObject {
        @Published var isNavigationActive = false
    }
    @State var email: String = ""
    @State var password: String = ""
    @State private var showWarning = false
    @State private var showNextScreen = false
    @ObservedObject var navigationManager = NavigationManager()
    
    var body: some View {
        VStack {
            Spacer()
                .navigationBarBackButtonHidden()
        }
        NavigationView {
            VStack {
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
                Spacer()
                VStack(alignment: .center) {
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    
                    Text("Welcome to")
                        .font(.custom("MontserratRoman-Light", size: 40))
                        .foregroundColor(Color.black)
                    
                    Text("Prom Planner")
                        .font(.custom("MontserratRoman-Bold", size: 40))
                        .foregroundColor(Color("Pink1"))
                    VStack {
                        
                        TextField("", text: self.$email, prompt: Text(" Email").foregroundColor(.black.opacity(0.9)).font(.custom("SourceSansPro-ExtraLight", size: 22))).padding(.leading, 15)
                            .autocapitalization(.none)
                            .frame(height: 58)
                            .textFieldStyle(PlainTextFieldStyle())
                            .padding([.horizontal], 4)
                            .background(Color("textfieldgray"))
                            .cornerRadius(16)
                            .padding([.horizontal], 24)
                            .padding(.bottom, 20)
                        
                        
                        
                        
                        SecureTextField(text: $password)
                            .padding(.leading, 15)
                            .frame(height: 58)
                            .textFieldStyle(PlainTextFieldStyle())
                            .padding([.horizontal], 4)
                            .background(Color("textfieldgray"))
                            .cornerRadius(16)
                            .padding([.horizontal], 24)
                            .padding(.bottom, 20)
                        
                        
                        
                        
                        
                        
                        /*Button {
                         print("Image tapped!")
                         } label: {
                         Text("Log In")
                         }
                         .padding()
                         
                         .frame(width: 330, height: 55)
                         .background(Color("Pink1"))
                         .foregroundColor(.white)
                         .clipShape(RoundedRectangle(cornerRadius: 15))
                         .fontWeight(.bold)
                         .font(.custom("MontserratRoman-Regular", size: 25))*/
                        
                        
                        
                        
                        
                        /*NavigationLink(destination: HomeView1()) {
                         
                         
                         
                         Text("Log In ")
                         .frame(width: 330, height: 55)
                         .background(Color("Pink1"))
                         .foregroundColor(.white)
                         .clipShape(RoundedRectangle(cornerRadius: 15))
                         .fontWeight(.bold)
                         .font(.custom("MontserratRoman-Regular", size: 25))
                         
                         
                         
                         }*/
                        
                        VStack {
                            
                            
                            
                            if showWarning {
                                Text("Please fill in all fields")
                                    .foregroundColor(.red)
                            }
                            
                            
                            Button(action: {
                                if email.isEmpty || password.isEmpty {
                                    print("User input is null or empty")
                                    showWarning = true
                                    
                                } else {
                                    showWarning = false
                                    print("User input is not null")
                                    navigationManager.isNavigationActive = true
                                }                }) {
                                    Text("Log In")
                                        .foregroundColor(.white)
                                }
                                .frame(width: 330, height: 55)
                                .background(Color("Pink1"))
                                .foregroundColor(.white)
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                                .fontWeight(.bold)
                                .font(.custom("MontserratRoman-Regular", size: 25))
                            Spacer()
                        }
                        .background(
                            NavigationLink("", destination: HomeView1(), isActive: $navigationManager.isNavigationActive)
                                .opacity(0)
                        )
                        
                        
                        
                        
                        
                        
                        .environmentObject(navigationManager)
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        Spacer()
                        
                        Text("Don't have an account yet?")
                        
                        
                        
                        NavigationLink(destination: SignupView()) {
                            
                            Text("Click here to sign up")
                                .frame(width: 330, height: 55)
                                .background(Color("Pink1"))
                                .foregroundColor(.white)
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                                .fontWeight(.bold)
                                .font(.custom("MontserratRoman-Regular", size: 25))
                            
                            
                        }
                        
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        
                        
                    }
                }
            }
                    
                    
                    
                    
                    Spacer()
                    
                    
                    
                    
                    
                   
                    
                    
                    
                
                
                
            
            
            
            
            
            
            
            
            
            
        }
       
        
        
    }
    /*.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
     
     
     }
     init() {
     for familyName in UIFont.familyNames {
     print(familyName)
     for fontName in UIFont.fontNames(forFamilyName: familyName) {
     print("-- \(fontName)")
     }
     
     }
     }
     }*/
    
    
    struct LoginView_Previews: PreviewProvider {
        static var previews: some View {
            LoginView()
        }
    }
}

    
    #Preview {
        LoginView()
    }



    
    

