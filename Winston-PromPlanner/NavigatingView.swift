//
//  NavigatingView.swift
//  Winston-PromPlanner
//
//  Created by Winston Yang on 2023-09-29.
//

import SwiftUI

struct NavigatingView: View {
    var body: some View {
    
        Text("BIG FOOT")
        Spacer()
        Spacer()
        Spacer()
        Text("C SHARP")
                
                
        NavigationView {
            NavigationLink(destination: HomeView1()) {
               
                Text("Click here to sign up")
                    .frame(width: 330, height: 55)
                    .background(Color("Pink1"))
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .fontWeight(.bold)
                    .font(.custom("MontserratRoman-Regular", size: 25))
            
            }
            }
        
        
    }
}

struct NavigatingView_Previews: PreviewProvider {
    static var previews: some View {
        NavigatingView()
    }
}
