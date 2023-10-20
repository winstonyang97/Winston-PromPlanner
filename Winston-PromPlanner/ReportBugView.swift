import SwiftUI
struct ReportBugView: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var description: String = ""
    @State private var isSidebarShowing = false  // Initially sidebar is hidden
    @StateObject private var navigationManager = NavigationManager()  // For managing navigation
    @State private var selectedSection: Int? = 3  // Since we are on the events view, we select event label
    var body: some View {
        
        ZStack {
            navigationManager.currentView ?? AnyView(  // This will be HomeView1 or the view selected in SideBar
            VStack {
                HeaderView(isSidebarShowing: $isSidebarShowing)
                    .padding(.top, 60)
                Spacer(minLength: 55)

                Text("Report a Bug")
                    .font(.custom("MontserratRoman-Regular", size: 30))
                    .foregroundColor(Color("RectangleBlack"))
                    .padding(.top,-10)
                
                VStack(alignment: .leading) {
                    Text("Your Info")
                        .font(.title2)
                        .padding(.bottom, 5)
                        .padding(.top, 15)
                    
                    TextField("Name", text: $name)
                        .padding()
                        .background(Color.gray.opacity(0.4))
                        .cornerRadius(10)
                        .padding(.bottom, 10)

                    TextField("Email", text: $email)
                        .padding()
                        .background(Color.gray.opacity(0.4))
                        .cornerRadius(10)
                }
                .padding([.leading, .trailing])

                VStack(alignment: .leading) {
                    
                    Text("Bug Description")
                        .font(.title2)
                        .padding(.bottom, 5)
                        .padding(.top, 20)

                    TextEditor(text: $description)
                        .foregroundColor(.gray)
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                        .frame(height: 200)
                }
                .padding([.leading, .trailing])

                Button(action: {
                    // Handle the submission logic here
                }) {
                    Text("Submit")
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .frame(height: 60)
                        .foregroundColor(.white)
                        .font(.system(size: 25, weight: .bold))
                        .background(Color("Pink1"))
                        .cornerRadius(10)
                        .padding(.top, 20)
                }
                .padding([.top, .leading, .trailing])
                HStack {
                    Button(action: {
                        print("Left button tapped")
                    }, label: {
                        Image("leftarrow")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .padding(.trailing, 18)
                    })
                    Rectangle()
                        .fill(Color("RectangleBlack"))
                        .frame(width: 240, height: 10)
                }
                .position(x: 195, y: 80)
                Spacer()
            }
            .background(Color.white)
            .edgesIgnoringSafeArea(.all)
            )
            if isSidebarShowing {
                SideBar(selectedSection: $selectedSection, isShowing: $isSidebarShowing, navigationManager: navigationManager)
                    .frame(width: UIScreen.main.bounds.width / 2)
            }
        }
        
    }
}

struct ReportBugView_Previews: PreviewProvider {
    static var previews: some View {
        ReportBugView()
    }
}
