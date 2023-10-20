import SwiftUI
class NavigationManager: ObservableObject {
    @Published var currentView: AnyView?  // This will be used to change the view
}
struct HomeView1: View {
    @State private var selectedImageIndex = 0
    let images = ["Paris", "waterfall", "tajmahal", "china", "portugal"]
    @State private var isSidebarShowing = false  // Initially sidebar is hidden
    @State private var selectedSection: Int? = 0  // Initially, Home is selected
    @StateObject private var navigationManager = NavigationManager()  // For managing navigation

    var body: some View {
        
        ZStack {
            navigationManager.currentView ?? AnyView(  // This will be HomeView1 or the view selected in SideBar

            VStack {
                HeaderView(isSidebarShowing: $isSidebarShowing) //End of the very top header/logo view
                
                Spacer(minLength: 60)
                
                Text("Welcome Sample Name")
                    .font(.custom("MontserratRoman-Regular", size: 28))
                    .foregroundColor(Color("RectangleBlack"))
                    
                    .padding(.top, -50)
                
                ZStack { //Start of the pink box+image picker + big ad name description+ 5 circles
                    Rectangle()
                        .fill(Color("Pink1"))
                        .frame(width: 600, height: 300)
                        .ignoresSafeArea(.all)
                        .position(x: 210, y: 180)
                    
                    Text("Big Ad Name Description")
                        .font(.custom("MontserratRoman-Regular", size: 22))
                        .foregroundColor(.white)
                        .frame(width: 200)
                        .position(x: 125, y:65)
                    
                    Image(images[selectedImageIndex])
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300)
                        .padding(.top, 100)
                        .padding(.leading, -35)
                        .padding(.bottom, 45)
                    
                    HStack {
                        ForEach(0..<5) { index in
                            Circle()
                                .fill(selectedImageIndex == index ? Color.white : Color("circle"))
                                .frame(width: 12, height: 12)
                                .overlay(
                                    Circle()
                                        .stroke(Color.white, lineWidth: 2)
                                )
                                .padding(.horizontal, 5)
                                .onTapGesture {
                                    selectedImageIndex = index
                                }
                        }
                    }
                    .padding(.top, 20)
                    .position(x: 200, y:300)
                }
                .padding(.top, -20)
                
                VStack(spacing: 10) {
                    HStack(spacing: 20) {
                        BoxView(adDescription: "Ad 1")
                        BoxView(adDescription: "Ad 2")
                    }
                    
                    HStack(spacing: 20) {
                        BoxView(adDescription: "Ad 3")
                        BoxView(adDescription: "Ad 4")
                    }
                }
                .ignoresSafeArea(.all)
                .padding(.bottom, -50)
                .padding(.top, 8)
                
                Spacer()
                Spacer()
                Spacer()
                Spacer()
            }
            )
            if isSidebarShowing {
                SideBar(selectedSection: $selectedSection, isShowing: $isSidebarShowing, navigationManager: navigationManager)
            }
        }
    }
}


struct HomeView1_Previews: PreviewProvider {
    static var previews: some View {
        HomeView1()
    }
}

struct BoxView: View {
    var adDescription: String
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color("circle"))
                .frame(width: 170, height: 180) // increase width and height
            Rectangle()
                .fill(Color.white)
                .frame(width: 140, height: 90)
                .padding(.top,-55)
            VStack {
                Spacer() // push the text to the bottom of the box
                Text(adDescription)
                    .foregroundColor(.black)
                    .font(.custom("MontserratRoman-Regular", size: 20))
                    .font(.title)
                    .padding(.bottom, 20)
            }
        }
    }
}
