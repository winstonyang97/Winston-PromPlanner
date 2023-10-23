//
//  ContentView.swift
//  PromPlanner
//
//  Created by Chirag Shah on 2023-03-22.
//

import SwiftUI

struct ContentView: View {
    init() {
        for family in UIFont.familyNames.sorted() {
            let names = UIFont.fontNames(forFamilyName: family)
            print("Family: \(family) Font names: \(names)")
        }
    }

    var body: some View {
        Text("Hello")
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
