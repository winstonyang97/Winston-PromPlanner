//
//  EditView2.swift
//  PromPlanner
//
//  Created by Chirag Shah on 2023-04-26.
//

import SwiftUI

struct EditView2: View {
    @State var SampleUsername: String = ""
    @State var School: String = ""
    @State var Country: String = ""
    @State var State: String = ""
    @State var Grade: String = ""
    @State private var selectedGrade = 0
    let grades = ["Grade 9", "Grade 10", "Grade 11", "Grade 12"]
    @State private var showGradeDropdown = false
    @State private var rightArrowClicked: Bool? = nil
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
                Spacer(minLength: 10) // Adjust the minLength value to move the "Edit Account" text higher or lower
                Text("Edit Account")
                    .padding(.top, -100)
                    .font(.custom("MontserratRoman-Light", size: 40))
                    .foregroundColor(Color.black)
                    .padding(.leading, -15)
                
                
                VStack {
                    VStack(alignment: .leading, spacing: 25) {
                        TextField("", text: self.$SampleUsername, prompt: Text("Sample username ").foregroundColor(.black.opacity(0.9)).font(.custom("SourceSansPro-ExtraLight", size: 22)))
                            .textFieldStyle(PlainTextFieldStyle())
                            .padding(.leading, 15)
                            .frame(width: 280, height: 58)
                            .background(Color("textfieldgray"))
                            .cornerRadius(16)
                        
                        TextField("", text: self.$School, prompt: Text("School name ").foregroundColor(.black.opacity(0.9)).font(.custom("SourceSansPro-ExtraLight", size: 22)))
                            .textFieldStyle(PlainTextFieldStyle())
                            .padding(.leading, 15)
                            .frame(width: 280, height: 58)
                            .background(Color("textfieldgray"))
                            .cornerRadius(16)
                        
                        TextField("", text: self.$Country, prompt: Text("Country ").foregroundColor(.black.opacity(0.9)).font(.custom("SourceSansPro-ExtraLight", size: 22)))
                            .textFieldStyle(PlainTextFieldStyle())
                            .padding(.leading, 15)
                            .frame(width: 280, height: 58)
                            .background(Color("textfieldgray"))
                            .cornerRadius(16)
                        
                        TextField("", text: self.$State, prompt: Text("State/Province ").foregroundColor(.black.opacity(0.9)).font(.custom("SourceSansPro-ExtraLight", size: 22)))
                            .textFieldStyle(PlainTextFieldStyle())
                            .padding(.leading, 15)
                            .frame(width: 280, height: 58)
                            .background(Color("textfieldgray"))
                            .cornerRadius(16)
                        
                        
                        
                        ZStack(alignment: .topLeading) {
                            TextField("", text: $Grade)
                                .foregroundColor(.clear)
                            Text(grades[selectedGrade])
                                .foregroundColor(.black.opacity(0.9))
                                .font(.custom("SourceSansPro-ExtraLight", size: 22))
                                .padding(.leading, 15)
                                .padding(.top, 17)
                            HStack {
                                Spacer()
                                VStack {
                                    Image(systemName: "chevron.down")
                                        .foregroundColor(.blue)
                                        .padding(.trailing, 15)
                                        .padding(.top, 18)
                                        .onTapGesture {
                                            showGradeDropdown.toggle()
                                        }
                                }
                            }
                        }
                        .frame(width: 280, height: 58)
                        .background(Color("textfieldgray"))
                        .cornerRadius(16)
                        .overlay(
                            VStack {
                                if showGradeDropdown {
                                    Spacer(minLength: 58) // Adjust this value to change the gap between the text field and the dropdown menu
                                    CustomDropDown(showDropDown: $showGradeDropdown, selectedGrade: $selectedGrade, Grade: $Grade, grades: grades)
                                        .frame(width: 280, alignment: .leading)
                                }
                            }
                        )
                    }
                
                
                               
               HStack {
                   NavigationLink(
                       destination: EditView1().navigationBarBackButtonHidden(true),
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
                       .frame(width: 140, height: 10)
                   NavigationLink(
                       destination: EditView3().navigationBarBackButtonHidden(true),
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
               .padding(.top, 60)
           }
           
       }
            .padding()
        }
    
}
}

struct EditView2_Previews: PreviewProvider {
    static var previews: some View {
        EditView2()
    }
}

struct CustomDropDown: View {
    @Binding var showDropDown: Bool
    @Binding var selectedGrade: Int
    @Binding var Grade: String
    let grades: [String]

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            ForEach(0 ..< grades.count) { index in
                Button(action: {
                    selectedGrade = index
                    Grade = grades[selectedGrade]
                    showDropDown.toggle()
                }) {
                    Text(grades[index])
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                }
            }
        }
        .padding(.top)
        .background(Color.white)
        .cornerRadius(8)
        .shadow(radius: 5)
    }
}
