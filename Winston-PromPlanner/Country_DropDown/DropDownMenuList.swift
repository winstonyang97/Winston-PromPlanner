//
//  DropDownMenuList.swift
//  Winston-PromPlanner
//
//  Created by Winston Yang on 2023-10-24.
//

import SwiftUI

struct DropDownMenuList: View {
    
    // The drop down menu lit options
    let options: [DropDownMenu]
    
    // an action called when use select an option
    let onSelectedAction: (_ option: DropDownMenu) -> Void
    
    var body: some View {
        
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 2) {
                ForEach(options) { option in
                    // drop down menu list here
                    DropDownMenuListRow(option: option, onSelectedAction: self.onSelectedAction)
                }
            }
        }
        .frame(height: 200)
        .padding(.vertical, 5)
        .overlay {
            RoundedRectangle(cornerRadius: 16)
                .stroke(.gray, lineWidth: 2)
                .frame(width: 340)

        }
    }
}

struct DropdownMenuList_Previes: PreviewProvider {
    static var previews: some View {
        DropDownMenuList(options: DropDownMenu.testAllCountry, onSelectedAction: { _ in })
    }
}

#Preview {
    DropDownMenuList(options: DropDownMenu.testAllCountry, onSelectedAction: { _ in })
}

