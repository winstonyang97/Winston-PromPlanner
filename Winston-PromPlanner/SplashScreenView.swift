//
//  SplashScreenView.swift
//  Winston-PromPlanner
//
//  Created by Winston Yang on 2023-09-28.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
        if isActive {
            LoginView()
        } else {
            
            
            
            HStack {
                
                ZStack {
                    
                    HStack {
                        
                        Image("promLaunchscreen").resizable().ignoresSafeArea()
                    }
                    
                    
                    VStack {
                        
                        HStack {
                            Image("plain-white-rectangle").resizable().frame(width: 110.0, height: 5.0)
                            
                            Image("promplannerlogomain")
                            
                            Image("plain-white-rectangle").resizable().frame(width: 110.0, height: 5.0)
                        }
                        
                        
                        Spacer()
                        Spacer()
                        Spacer()
                        
                        
                        Image("promplanerlogo1").resizable().frame(width: 310.0, height: 40.0)
                        HStack {
                            Spacer()
                            Spacer()
                            Text("KEEP YOUR PROM ORGANIZED").foregroundColor(Color.white).bold().font(.system(size: 15))
                            Spacer()
                        }
                        
                        Spacer()
                        Spacer()
                        Spacer()
                        
                        
                        Rectangle()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 340.0, height: 5.0)
                            .foregroundColor(.white)
                            .clipShape(Capsule())
                            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        /* Text("Prom Planner")
                         .font(Font.custom("Arial", size: 50))
                         .foregroundColor(Color(red: 0.91, green: 0.26, blue: 0.58)/*.opacity(0.80)*/)
                         .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                         
                         Text("Keep your prom organized")
                         .font(Font.custom("Arial", size: 25))
                         .foregroundColor(Color(.white)) */
                    }
                    
                    
                }
                
                //.scaleEffect(size)
                .opacity(opacity)
                .onAppear {
                    withAnimation(.easeIn(duration: 1.2)) {
                        self.size = 0.9
                        self.opacity = 1.0
                    }
                }.onAppear() {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        withAnimation {
                            self.isActive = true
                            
                        }
                    }
                }
                
                
            }
            
            
        }
        
    }
    
    
    
    struct SplashScreenView_Previews: PreviewProvider {
        static var previews: some View {
            SplashScreenView()
        }
    }
}

#if DEBUG
struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
#endif



