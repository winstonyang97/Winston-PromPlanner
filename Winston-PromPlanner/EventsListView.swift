
import SwiftUI

struct EventsListView: View {
        @State private var isSidebarShowing = false  // Initially sidebar is hidden
        @StateObject private var navigationManager = NavigationManager()  // For managing navigation
        @State private var selectedSection: Int? = 1  // Since we are on the events view, we select event label
        
        var body: some View {
                ZStack {
                    navigationManager.currentView ?? AnyView(
                    EventListView1(isSidebarShowing: $isSidebarShowing)
                    )
                    if isSidebarShowing {
                        SideBar(selectedSection: $selectedSection, isShowing: $isSidebarShowing, navigationManager: navigationManager)
                            .frame(width: UIScreen.main.bounds.width / 2)
                    }
                }
            }
        }



struct EventsListView_Previews: PreviewProvider {
    static var previews: some View {
        EventsListView()
    }
}


//Different Views Start here

struct PinkBoxView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color("Pink1"))
                .frame(width: 500, height: 280)
                .ignoresSafeArea(.all)
                .padding(.top, -310)
            
            Text("Winter Funfest Prom ")
                .font(.custom("MontserratRoman-Regular", size: 25))
                .foregroundColor(.white)
                .frame(width: 300)
                .position(x: 195, y:-10)
                
            Text("May 2nd")
                .font(.custom("MontserratRoman-Regular", size: 25))
                .foregroundColor(.white)
                .frame(width: 300)
                .position(x: 115, y:25)
               
            Image("winter")
                .resizable()
                .frame(width: 340, height: 160)
                .padding(.top,-220)
                .padding(.leading,4)
        }
    }
}



struct EventsTextView: View {
    var Text1: String
    var body: some View {
        Text(Text1)
        
            .font(.custom("MontserratRoman-Regular", size: 35))
            .foregroundColor(Color("RectangleBlack"))
            .padding(.top, -55)
        
    }
}

struct HeaderView: View {
    @Binding var isSidebarShowing: Bool  // Binding to control the sidebar

    var body: some View {
        HStack {
            Image("house")
                .resizable()
                .frame(width: 45, height: 50)
                .padding(.trailing, 10)
            Rectangle()
                .fill(Color("RectangleBlack"))
                .frame(width: 50, height: 6)
                .padding(.trailing, 2)
            Image("Logomain")
            
                .resizable()
                .frame(width: 95, height: 68)
                .padding(.leading, 2)
            Rectangle()
                .fill(Color("RectangleBlack"))
                .frame(width: 50, height: 6)
                .padding(.leading, 2)
            Button(action: {
                isSidebarShowing.toggle()
            }) {
                Image("more")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .padding(.leading, 10)
                    .padding(.trailing, 5)
            }
        }
    }
}

struct EventListView1: View {
    @Binding var isSidebarShowing: Bool  // Use a binding instead of a state
    @StateObject private var navigationManager = NavigationManager()  // For managing navigation
    @State private var selectedSection: Int? = 1  // Since we are on the events view, we select event label
    var body: some View {
        navigationManager.currentView ?? AnyView(
            VStack {
                HeaderView(isSidebarShowing: $isSidebarShowing)
                Spacer(minLength: 60)
                EventsTextView(Text1: "Events")
                PinkBoxView()
                    .padding(.top, 50)
                ZStack {
                    Rectangle()
                        .fill(Color("circle"))
                        .padding(.bottom, -20)
                        .frame(width: 380, height: 85)
                        .offset(y: CGFloat(25))
                    Image("Carnival")
                        .resizable()
                        .frame(width: 90, height: 80)
                        .padding(.leading, -180)
                        .offset(y: CGFloat(35))
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Carnival Prom ")
                            .font(.custom("MontserratRoman-Regular", size: 20))
                            .position(x: 242, y: 38)
                        Text("February 22nd")
                            .font(.custom("MontserratRoman-Regular", size: 20))
                            .position(x: 242, y: 40)
                    }
                    .frame(height: 60)
                }
                .padding(.top, -50)
                ZStack {
                    Rectangle()
                        .fill(Color("circle"))
                        .padding(.bottom, -20)
                        .frame(width: 380, height: 85)
                        .offset(y: CGFloat(-108))
                    Image("Forest")
                        .resizable()
                        .frame(width: 90, height: 80)
                        .padding(.leading, -180)
                        .padding(.top, -137)
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Enchanted Forest")
                            .font(.custom("MontserratRoman-Regular", size: 20))
                            .position(x: 258, y: -95)
                        Text("April 2nd")
                            .font(.custom("MontserratRoman-Regular", size: 20))
                            .position(x: 217, y: -95)
                    }
                    .frame(height: 60)
                }
                .padding(.top, -80)
                ZStack {
                    Rectangle()
                        .fill(Color("circle"))
                        .padding(.bottom, -20)
                        .frame(width: 380, height: 85)
                        .offset(y: CGFloat(-250))
                    Image("Charleston")
                        .resizable()
                        .frame(width: 90, height: 80)
                        .padding(.leading, -180)
                        .padding(.top, -280)
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Charleston Prom")
                            .font(.custom("MontserratRoman-Regular", size: 20))
                            .position(x: 254, y: -235)
                        Text("June 15th")
                            .font(.custom("MontserratRoman-Regular", size: 20))
                            .position(x: 218, y: -235)
                    }
                    .frame(height: 60)
                    
                }
                .padding(.top, -70)
                
                
            }
        )
    }
}
