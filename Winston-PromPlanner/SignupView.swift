//
//  SignupView.swift
//  PromPlanner
//
//  Created by Chirag Shah on 2023-03-26.
//

import SwiftUI
class User: ObservableObject {
    @Published var firstName = ""
    @Published var lastName = ""
}
struct SignupView: View {
    @EnvironmentObject var user: User
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var Email: String = ""
    @State var phoneNumber: String = ""
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
                            .padding(.leading, 15)
                            .frame(height: 58)
                            .textFieldStyle(PlainTextFieldStyle())
                            .padding([.horizontal], 4)
                            .background(Color("textfieldgray"))
                            .cornerRadius(16)
                            .padding([.horizontal], 24)
                            .padding(.bottom, 20)
                        TextField("", text: self.$phoneNumber, prompt: Text("Phone Number").foregroundColor(.black.opacity(0.9)).font(.custom("SourceSansPro-ExtraLight", size: 22)))
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
                        Footer()

                        
                    }
                    Spacer(minLength: 100)
                }
            }
        }
        
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
            .environmentObject(User())
    }
}

struct Footer: View {
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
                .fill(Color("RectangleBlack"))
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
}
