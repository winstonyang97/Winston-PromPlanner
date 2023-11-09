//
//  EditView2.swift
//  PromPlanner
//
//  Created by Chirag Shah on 2023-04-26.
//

import SwiftUI

struct EditView2: View {
    @State var sampleUsername: String = ""
    @State var school: String = ""
    @State var country: String = ""
    @State var state: String = ""
    @State var grade: String = ""
    @State private var path = [String]()
    
    @State private var showGradeDropdown = false
    @State private var selectedGrade = "Grade"
    let grades = ["Grade 9", "Grade 10", "Grade 11", "Grade 12"]
    
    @State private var rightArrowClicked: Bool? = nil
    @State private var leftArrowClicked: Bool? = nil
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                Image("promplannerlogomain")
                    .resizable()
                    .frame(width: 95, height: 68)
                Text("Edit Account")
                    .font(.system(size: 40))
                    .foregroundColor(Color.black)
                    .padding(.bottom, 40)
                
                VStack {
                    VStack(alignment: .leading) {
                        
                        InputView(text: $sampleUsername, placeholder: "Username")
                            .autocapitalization(.none)
                        
                        InputView(text: $school, placeholder: "School Name")
                        
                        InputView(text: $country, placeholder: "Country")
                        
                        InputView(text: $state, placeholder: "State/Province")
                            .padding(.bottom, 20)
                        
                        Button(action: {
                            showGradeDropdown.toggle()
                        }) {
                            HStack {
                                Text(selectedGrade)
                                    .foregroundColor(selectedGrade == "Grade" ? Color(.systemGray2) : .black)
                                    .font(Font(CTFont(.label, size: 17)))
                                    .fontWeight(.semibold)
                                    .padding(25)
                                Spacer()
                                Image(systemName: "chevron.down")
                                    .padding(.trailing, 20)
                            }
                            .frame(width: 320, height: 65)
                            .background(
                                RoundedRectangle(cornerRadius: 15)
                                    .foregroundColor(Color("InputFieldBackground"))
                            )
                        }
                        .overlay(
                            Group {
                                if showGradeDropdown {
                                    VStack(alignment: .leading, spacing: 4) {
                                        ForEach(grades, id: \.self) { grade in
                                            Button(action: {
                                                selectedGrade = grade
                                                showGradeDropdown.toggle()
                                            }) {
                                                Text(grade)
                                                    .foregroundColor(.black)
                                                    .frame(maxWidth: .infinity, alignment: .leading)
                                                    .padding(.horizontal)
                                            }
                                        }
                                    }
                                    .background(Color.white)
                                    .cornerRadius(8)
                                    .shadow(radius: 5)
                                    .offset(y: 65) // Adjust this value as necessary to position the dropdown below the button
                                    .zIndex(1)
                                }
                            }, alignment: .topLeading
                        )
                    }
                    
                    HStack {
                        Button {
                            leftArrowClicked?.toggle()
                            path.append("tag1")
                        } label: {
                            Image(systemName: "arrow.left")
                                .resizable()
                                .frame(width: 30, height: 25)
                                .padding(.leading, 5)
                        }
                        Rectangle()
                            .fill(Color("RectangleBlack"))
                            .frame(width: 140, height: 10)
                        Button {
                            rightArrowClicked?.toggle()
                            path.append("tag2")
                        } label: {
                            Image(systemName: "arrow.right")
                                .resizable()
                                .frame(width: 30, height: 25)
                                .padding(.leading, 5)
                        }
                    }
                    .padding(.top, 30)
                    .navigationDestination(for: String.self) { route in
                        switch route {
                        case "tag1":
                            EditView1()
                        case "tag2":
                            EditView3()
                        default:
                            EditView2()
                        }
                    }
                }
            }
            .padding()
        }
        
    }
    
    struct EditView2_Previews: PreviewProvider {
        static var previews: some View {
            EditView2()
        }
    }
}
