import SwiftUI
struct SideBar: View {
    @Binding var selectedSection: Int?
    @Binding var isShowing: Bool  // New binding
    @ObservedObject var navigationManager: NavigationManager  // New property

    var body: some View {
        VStack(alignment: .leading, spacing: 28) {
            Button(action: {
                isShowing = false
            }) {
                Image(systemName: "xmark.circle")  // SF Symbol name for "X"
                    .font(.system(size: 45))
                    .foregroundColor(.black)
                    
                    .padding(.leading, -40)
                    .padding(.top, 80)
            }
            .offset(x:60)
            ZStack {
                Circle()
                    .fill(Color.white)
                    .frame(width: 100)
                Image("Logomain")
                    .resizable()
                    .frame(width: 70, height: 50)
                    .padding(.top, 10)
                    .padding(.leading, 4)
            }
            .padding(.top, 10)
            .padding(.leading, 50)
            
            Text("Hi, Sample Name")
                .font(.custom("MontserratRoman-Regular", size: 22))
                .foregroundColor(.black)
                .padding(.horizontal, 23)
                .padding(.bottom, 5)
            
            ForEach(0..<4) { index in
                Button(action: {
                    isShowing = false
                    selectedSection = index
                    navigationManager.currentView = destinationView(for: index)
                }) {
                    HStack(alignment: .center, spacing: 0) {
                        Image("leftarrow")
                            .resizable()
                            .frame(width: 35, height: 35)
                            .padding(.trailing, 10)
                        Text(sectionName(for: index))
                            .font(.custom("MontserratRoman-ExtraLight", size: 22))
                            .foregroundColor(.black)
                            .padding(.leading, 10)
                        Spacer()
                    }
                    .padding(.horizontal, 15)  // Reduce this value to decrease the space around HStack
                    .padding(.vertical, 10)  // Increase this value to increase the height of the white rectangle
                    .background(selectedSection == index ? Color.white : Color.clear)
                }
            }

            Spacer()
        }
        .edgesIgnoringSafeArea(.all)
        .frame(width: 280, height: 900)
        .background(Color("circle").opacity(0.9))
        .padding(.trailing, -145)
        
        
    }
    
    private func sectionName(for index: Int) -> String {
        switch index {
        case 0: return "Home"
        case 1: return "Events"
        case 2: return "Edit Profile"
        case 3: return "Report a Bug"
        default: return ""
        }
    }
    
    private func destinationView(for index: Int) -> AnyView {
        switch index {
        case 0: return AnyView(HomeView1())
        case 1: return AnyView(EventsListView())
        case 2: return AnyView(EditView1())
        case 3: return AnyView(ReportBugView())
        default: return AnyView(EmptyView())
        }
    }
}

struct SideBar_Previews: PreviewProvider {
    static var previews: some View {
        SideBar(selectedSection: .constant(0), isShowing: .constant(true), navigationManager: NavigationManager()) // 0 will highlight the Home section initially
    }
}
