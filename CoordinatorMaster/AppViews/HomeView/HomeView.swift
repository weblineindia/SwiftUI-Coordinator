import SwiftUI

struct HomeView: View {
    @EnvironmentObject var coordinator: BaseCoordinator
    @StateObject var viewModel: HomeViewModel
    @State var selectedView = 0
    
    @State private var showLogoutAlert = false
    
    var body: some View {
        content()
            .onAppear {
                UITabBar.appearance().backgroundColor = .lightText
            }
        
    }
    
    @ViewBuilder private func content() -> some View {
        ZStack {
            TabView(selection: $selectedView) {
                
                firstTabView()
                    .tabItem {
                        Label("Home", systemImage: selectedView == 0 ? "house.circle.fill" : "house.circle")
                    }
                    .tag(0)
                
                secondTabView()
                    .tabItem {
                        Label("Settings", systemImage: selectedView == 1 ? "person.circle.fill" : "person.circle")
                    }
                    .tag(1)
                
            }.tint(.purple)
                .navigationMode(title: selectedView == 0 ? "Home" : "Settings", displayMode: .inline)
                .navigationBarBackButtonHidden(true)
            
        }
    }
    
    @ViewBuilder private func firstTabView() -> some View {
        ScrollView {
            VStack {
                
                switch viewModel.state {
                case .idle:
                    IdleView()
                        .onAppear {
                            viewModel.fetchData()
                        }
                case .loading:
                    ProgressView()
                case .failed(let error):
                    ErrorView(error: error)
                case .success(let user):
                    
                    ForEach(user, id: \.self ) { item in
                        Button {
                            coordinator.gotoGeneralDetail(text: "\(item.user)")
                        } label: {
                            GroupBox {
                                HStack {
                                    Text("\(item.user)").foregroundColor(.black)
                                    Spacer()
                                }
                            }
                        }
                    }
                }
            }
        }.refreshable {
            viewModel.setHomeApiState(stat: .loading)
            viewModel.fetchData()
        }
    }
    
    @ViewBuilder private func secondTabView() -> some View {
        ScrollView {
            ZStack {
                Spacer(minLength: 100)
                HStack {
                    VStack(alignment: .leading, spacing: 20) {
                        Group {
                            Button("Push to View") {
                                coordinator.settingActionProfileDetail(user: ["Hello User"] as [Any])
                            }
                            Divider()
                        }
                        Group {
                            Button("Present full screen cover", action: coordinator.settingActionPnP)
                            Divider()
                        }
                        Group {
                            Button("Present Sheet View", action: coordinator.settingActionTnC)
                            Divider()
                        }
                        Group {
                            Button("Logout") {
                                showLogoutAlert = true
                            }
                        }
                    }
                    Spacer()
                }.padding()
            }.alert(isPresented: $showLogoutAlert) {
                Alert(
                    title: Text("Logout!!"),
                    message: Text("Are you sure you want logout?"),
                    primaryButton: .destructive(Text("Logout")) {
                        withTransaction(.init(animation: .default)) {
                            logout()
                        }
                    },
                    secondaryButton: .cancel()
                )
            }
            
        }
    }
    
    func logout() {
        coordinator.initiateLogin()
    }
    
}

//struct HcontentView_Previews: PreviewProvider {
//    static var previews: some View {
//       // ContentView(viewModel: ContentViewModel())
//        HomeView(viewModel: HomeViewModel())
//    }
//}
