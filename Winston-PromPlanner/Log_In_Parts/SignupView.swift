//
//  SignupView.swift
//  PromPlanner
//
//  Created by Chirag Shah on 2023-03-26.
//

import SwiftUI
import iPhoneNumberField
class User: ObservableObject {
    @Published var firstName = ""
    @Published var lastName = ""
}
struct SignupView: View {
    class NavigationManager: ObservableObject {
        @Published var isNavigationActiveToLoginView = false
        @Published var isNavigationActiveToSignupView2 = false
    }
    @EnvironmentObject var user: User
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var Email: String = ""
    @State var phoneNumber: String = ""
    @State private var rightArrowClicked: Bool? = nil
    @State private var showWarning = false
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var navigationManager = NavigationManager()
    @State private var isLoginView = false
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
                    Text("Welcome, let us get to know you.")
                        .font(.custom("MontserratRoman-ExtraLight", size: 20))
                        .padding(.bottom, 10)
                        .foregroundColor(Color.black)
                    
                    VStack {
                        TextField("", text: self.$firstName, prompt: Text("First Name").foregroundColor(.black.opacity(0.9)).font(.custom("SourceSansPro-ExtraLight", size: 22)))
                            .padding(.leading, 15)
                            .frame(height: 58)
                            .textFieldStyle(PlainTextFieldStyle())
                            .padding([.horizontal], 4)
                            .background(Color("textfieldgray"))
                            .cornerRadius(16)
                            .padding([.horizontal], 24)
                            .padding(.bottom, 20)
                        TextField("", text: self.$lastName, prompt: Text("Last Name").foregroundColor(.black.opacity(0.9)).font(.custom("SourceSansPro-ExtraLight", size: 22)))
                            .padding(.leading, 15)
                            .frame(height: 58)
                            .textFieldStyle(PlainTextFieldStyle())
                            .padding([.horizontal], 4)
                            .background(Color("textfieldgray"))
                            .cornerRadius(16)
                            .padding([.horizontal], 24)
                            .padding(.bottom, 20)
                        TextField("", text: self.$Email, prompt: Text("Email").foregroundColor(.black.opacity(0.9)).font(.custom("SourceSansPro-ExtraLight", size: 22)))
                            .autocapitalization(.none)
                            .padding(.leading, 15)
                            .frame(height: 58)
                            .textFieldStyle(PlainTextFieldStyle())
                            .padding([.horizontal], 4)
                            .background(Color("textfieldgray"))
                            .cornerRadius(16)
                            .padding([.horizontal], 24)
                            .padding(.bottom, 20)
                        
                            iPhoneNumberField("Phone Number", text: self.$phoneNumber)
                            .flagHidden(false)
                                        .flagSelectable(true)
                                        .font(UIFont(size: 22))
                                        .padding()
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
                        
                        VStack {
                            Spacer()
                            if showWarning {
                                Text("Please fill in all fields")
                                    .foregroundColor(.red)
                            }
                            HStack {
                                Spacer()
                                Button(action: {
                                    dismiss()
                                    isLoginView = true
                                }) {
                                    Image(systemName: "chevron.left")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                        .foregroundColor(Color("Pink1"))
                                    
                                    
                                }
                                /*.background(
                                    NavigationLink("", destination: LoginView(), isActive: $isLoginView)
                                        .opacity(0)
                                )*/
                                
                                
                                
                                
                                
                                
                                .environmentObject(navigationManager)
                                .navigationBarBackButtonHidden(true)
                                Spacer()
                                
                                Button(action: {
                                    if Email.isEmpty || firstName.isEmpty || lastName.isEmpty || phoneNumber.isEmpty {
                                        print("User input is null or empty")
                                        showWarning = true
                                        
                                    } else {
                                        showWarning = false
                                        print("User input is not null")
                                        navigationManager.isNavigationActiveToSignupView2 = true
                                    }}) {
                                        Image(systemName: "chevron.right")
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                            .foregroundColor(Color("Pink1"))
                                        
                                    }
                                    .background(
                                        NavigationLink("", destination: SignupView2(firstName: firstName, lastName: lastName), isActive: $navigationManager.isNavigationActiveToSignupView2)
                                            .opacity(0)
                                    )
                                
                                    .environmentObject(navigationManager)
                                    .navigationBarBackButtonHidden(true)
                                Spacer()
                                
                            }
                            Spacer()
                            Spacer()
                        }
                    }
                }
                    
                
            }
        }
        
    //}
    
    
    struct SignupView_Previews: PreviewProvider {
        static var previews: some View {
            SignupView()
                .environmentObject(User())
        }
    }
    
    /*struct Footer: View {
     @EnvironmentObject var user: User
     @State var firstName: String = ""
     @State var lastName: String = ""
     @State var Email: String = ""
     @State var phoneNumber: String = ""
     @State private var rightArrowClicked: Bool? = nil
     var body: some View {
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
     .fill(Color(.red))
     .frame(width: 140, height: 10)
     NavigationLink(
     destination: SignupView2(firstName: firstName, lastName: lastName).environmentObject(user).navigationBarBackButtonHidden(true),
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
     .position(x: 205, y: 180)
     }
     }*/
}

#Preview {
    SignupView()
}
