//
//  DropDownList.swift
//  Winston-PromPlanner
//
//  Created by Winston Yang on 2023-10-24.
//

import SwiftUI

struct DropDownList: View {
    // Used to show or hide drop-down menu otpions
    @State private var isOptionPresented: Bool = false
    
    // Used to bind user selection
    @Binding var selectedOption: DropDownMenu?
    
    let placeholder: String
    
    let options: [DropDownMenu]
    
    @State private var isTextVisible = true
    
    @State var Country: String = ""
    
    @State var selectedCountry = ""
    
    var body: some View {
        VStack {
            
            TextField("", text: self.$Country, prompt: Text("Country").foregroundColor(.black.opacity(0.9)).font(.custom("SourceSansPro-ExtraLight", size: 22)))
                .padding(.leading, 15)
                .frame(height: 58)
                .textFieldStyle(PlainTextFieldStyle())
                .padding([.horizontal], 4)
                .background(Color("textfieldgray"))
                .cornerRadius(16)
                .padding([.horizontal], 24)
                .padding(.bottom, 20)
            
            Button(action: {
                withAnimation {
                    isTextVisible = false
                    self.isOptionPresented.toggle()
                }
            }) {
                HStack {
                    Text(selectedOption == nil ? placeholder : selectedOption!.option)
                        .fontWeight(.medium)
                        .foregroundColor(selectedOption == nil ? .gray : .black)
                    Spacer()
                    
                    Image(systemName: self.isOptionPresented ? "chevron.up" : "chevron.down")
                        .fontWeight(.medium)
                        .foregroundColor(.black)
                }
            }
            .padding()
            .overlay {
                RoundedRectangle(cornerRadius: 16)
                    .stroke(.gray, lineWidth: 2)
                    .frame(width: 340, height: 58)
                if isTextVisible && selectedCountry.isEmpty {
                    
                    Text("Select Your Country                  ")
                        .foregroundColor(.black.opacity(0.9)).font(.custom("SourceSansPro-ExtraLight", size: 22))
                    
                } else {
                    
                }
                
                
                
                
                   
                   
                
            }
            .overlay(alignment: .top) {
                VStack {
                    if self.isOptionPresented {
                        Spacer(minLength: 60)
                        // Drop-down menu options list
                        DropDownMenuList(options: self.options) { option in
                            self.isOptionPresented = false
                            self.selectedOption = option
                        }
                    }
                }
            }
            .padding(.horizontal)
            
            
        }
    }
}

struct DropDownList_Previews: PreviewProvider {
    static var previews: some View {
        DropDownList(
            selectedOption: .constant(nil),
            placeholder: "",
            options: DropDownMenu.testAllCountry
        )
    }
}

