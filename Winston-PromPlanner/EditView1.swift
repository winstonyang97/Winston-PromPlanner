//
//  EditView1.swift
//  PromPlanner
//
//  Created by Chirag Shah on 2023-04-03.
//

import SwiftUI

struct EditView1: View {
    var firstName: String = ""
    var lastName: String = ""
    var phoneNumber: String  = ""
    var email: String  = ""
    @State var displayedName: String = ""
    @State var displayedPhoneNumber: String = ""
    @State var displayedEmail: String = ""
    @State private var isSidebarShowing = false  // Initially sidebar is hidden
    @StateObject private var navigationManager = NavigationManager()  // For managing navigation
    @State private var selectedSection: Int? = 2  // Since we are on the events view, we select event label
    var body: some View {
        NavigationView {
            ZStack {
                navigationManager.currentView ?? AnyView(  // This will be HomeView1 or the view selected in SideBar

                VStack {
                    HeaderView(isSidebarShowing: $isSidebarShowing) //End of the very top header/logo view
                    Spacer(minLength: 80)
                    VStack(alignment: .center) {
                        
                        Text("Edit Profile")
                            .font(.custom("MontserratRoman-Light", size: 40))
                            .foregroundColor(Color.black)
                            .padding(.top, -40)
                        ZStack {
                            Circle()
                                .fill(Color("circle"))
                                .frame(width: 300)
                                .frame(height: 130)
                            Image("Logomain")
                                .resizable()
                                .frame(width: 95, height: 68)
                                .padding(.leading, 2)
                        }
                        
                        ZStack {
                            Circle()
                                .fill(Color("Pink1"))
                                .frame(width: 55, height: 95)
                            Image("edit")
                                .frame(width: 5)
                                .padding(.trailing, -2)
                        }
                        .position(x: 255, y: -30)
                        
                        VStack {
                            VStack {
                                Text("Name")
                                    .font(.custom("MontserratRoman-Regular", size: 25))
                                    .foregroundColor(Color("RectangleBlack"))
                                    .padding(.top, -180)
                                    .padding(.leading, -150)
                                TextField("", text: self.$displayedName, prompt: Text("\(firstName) \(lastName)").foregroundColor(.black.opacity(0.9)).font(.custom("SourceSansPro-ExtraLight", size: 22)))
                                    .padding(.leading, 15)
                                    .frame(width: 280, height: 58)
                                    .textFieldStyle(PlainTextFieldStyle())
                                    .padding([.horizontal], 4)
                                    .background(Color("textfieldgray"))
                                    .cornerRadius(16)
                                    .padding(.top, -155)
                            }
                            .padding(.bottom, -130)
                            Spacer(minLength: 20)
                            VStack {
                                Text("Phone Number")
                                    .font(.custom("MontserratRoman-Regular", size: 25))
                                    .padding(.top, -85)
                                    .foregroundColor(Color("RectangleBlack"))
                                    .padding(.leading, -110)
                                TextField("", text: self.$displayedPhoneNumber, prompt: Text("\(phoneNumber) ").foregroundColor(.black.opacity(0.9)).font(.custom("SourceSansPro-ExtraLight", size: 22)))
                                    .padding(.leading, 15)
                                    .frame(width: 280, height: 58)
                                    .textFieldStyle(PlainTextFieldStyle())
                                    .padding([.horizontal], 4)
                                    .background(Color("textfieldgray"))
                                    .cornerRadius(16)
                                    .padding(.leading, -10)
                                    .padding(.top, -65)
                            }
                            Spacer(minLength: 15)
                            VStack {
                                Text("Email")
                                    .padding(.top, -15)
                                    .font(.custom("MontserratRoman-Regular", size: 25))
                                    .foregroundColor(Color("RectangleBlack"))
                                    .padding(.leading, -150)
                                    .padding(.bottom, -10)
                                TextField("", text: self.$displayedEmail, prompt: Text("\(email) ").foregroundColor(Color.white).font(.custom("SourceSansPro-ExtraLight", size: 22)))
                                    .padding(.leading, 15)
                                    .frame(width: 280, height: 58)
                                    .textFieldStyle(PlainTextFieldStyle())
                                    .padding([.horizontal], 4)
                                    .background(Color("Pink1"))
                                    .cornerRadius(16)
                                    .padding(.leading, -10)
                                    .padding(.bottom, -10)
                                    .padding(.top, 5)
                                Text("More...")
                                    .font(.custom("MontserratRoman-Regular", size: 18))
                                    .foregroundColor(Color("RectangleBlack"))
                                    .padding(.top, 30) // Increased the padding value to create more space
                                Rectangle()
                                    .fill(Color.black)
                                    .frame(width: 200, height: 2)
                                Text("Forgot your password?")
                                    .font(.custom("MontserratRoman-Regular", size: 18))
                                    .foregroundColor(Color("RectangleBlack"))
                                    .padding(.top, 10)
                            }
                            Spacer(minLength: 110)
                        }
                        .padding(.bottom, -90)
                        .padding(.top, 120)
                        
                    Footer2()
                        
                    }
                }
                )
                if isSidebarShowing {
                    SideBar(selectedSection: $selectedSection, isShowing: $isSidebarShowing, navigationManager: navigationManager)
                        .frame(width: UIScreen.main.bounds.width / 2)
                }
            }
        }
        
    }
}

struct EditView1_Previews: PreviewProvider {
    static var previews: some View {
        EditView1()
    }
}

struct Footer2: View {
    @State private var RightArrowClicked: Bool? = nil

    var body: some View {
        HStack {
            
            Rectangle()
                .fill(Color("RectangleBlack"))
                .frame(width: 140, height: 10)
            NavigationLink(
                destination: EditView2().navigationBarBackButtonHidden(true),
                tag: true,
                selection: $RightArrowClicked,
                label: {
                    Image("rightarrow")
                        .resizable()
                        .frame(width: 65, height: 55)
                        .padding(.leading, 5)
                }
            )
            
            
        }
        .position(x: 240, y: 50)
    }
}
