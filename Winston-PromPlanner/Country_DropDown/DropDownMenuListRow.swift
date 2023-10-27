//
//  DropDownMenuListRow.swift
//  Winston-PromPlanner
//
//  Created by Winston Yang on 2023-10-24.
//

import SwiftUI

struct DropDownMenuListRow: View {
    
    let option: DropDownMenu
    
    // an action called when use select an option
    let onSelectedAction: (_ option: DropDownMenu) -> Void
    

    var body: some View {
        Button(action: {
            self.onSelectedAction(option)
        }) {
            Text(option.option)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .foregroundColor(.black)
        .padding(.vertical, 5)
        .padding(.horizontal)
    }
}


#Preview {
    DropDownMenuListRow(option: DropDownMenu.testSingleCountry, onSelectedAction: { _ in })
}
