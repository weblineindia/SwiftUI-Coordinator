import Foundation
import SwiftUI

class ViewFactory {
    @ViewBuilder static func viewForDestination(_ destination: DestinationFlowPage) -> some View {
        switch destination {
        case .login:
            self.getLoginView()
        case .signup:
            self.getSignupView()
        case .home:
            self.getHomeView()
        case .settings:
            EmptyView()
        case .profile:
            EmptyView()
        case .profileDetail(user: let user):
            getProfileDetailView(user: user)
        case .homeDetail:
            EmptyView()
        case .generalDetail(text: let text):
            getGeneralDetail(text: text)
        case .settingsTnC:
            getSettingTnC()
        case .settingsPnP:
            getSettingPnP()
        }
    }
    
    static func getLoginView() -> some View {
        let view = LoginView(viewModel: LoginViewModel())
        return view
    }
    static func getSignupView() -> some View {
        let view = SignUpView(viewModel: SignupViewModel())
        return view
    }
    static func getHomeView() -> some View {
        let view = HomeView(viewModel: HomeViewModel())
        return view
    }
    static func getProfileView() -> some View {
        EmptyView()
    }
    static func getProfileDetailView(user: Any) -> some View {
        UserProfileView(viewModel: UserProfileViewModel(data: user))
    }
    static func getGeneralDetail(text: String) -> some View {
        Text(text).setCustomNavigationBackButton(title: "", image: "") {
        }.navigationTitle("Detail")
    }
    static func getSettingTnC() -> some View {
        SheetView(viewModel: SheetViewModel(text: "Hello this is sheet"))
    }
    static func getSettingPnP() -> some View {
        CoverView(viewModel: CoverViewModel(text: "hello full screen cover"))
    }
    
}
