import Foundation
import SwiftUI

/// Base cooridnator class with default method
final class BaseCoordinator: ObservableObject {
    @Published var path = NavigationPath()
    @Published var presentSheetItem: DestinationFlowPage?
    @Published var fullCoverItem: DestinationFlowPage?
    
    func gotoRoot() {
        path.removeLast(path.count)
    }
    func gotoGeneralDetail(text: String) {
        path.append(DestinationFlowPage.generalDetail(text: text))
    }
    
    func initiateLogin() {
        path.append(DestinationFlowPage.login)
    }
    func initiateHome() {
        path.append(DestinationFlowPage.home)
    }
    
}

/// screens protocol define as per navigation required
protocol LoginNavigator {
    func loginActionSignup()
    func loginActionHome()
}

protocol SignupNavigator {
    func signupActionBackToLogin()
}

protocol SettingsNavigator {
    func settingActionLogout()
    func settingActionTnC()
    func settingActionPnP()
    func settingActionProfileDetail(user: Any)
}

/// Extended Base coordinator class with screen added required navigation
extension BaseCoordinator: LoginNavigator {
    func loginActionHome() {
        path.append(DestinationFlowPage.home)
    }
    
    func loginActionSignup() {
        path.append(DestinationFlowPage.signup)
    }
}

extension BaseCoordinator: SignupNavigator {
    func signupActionBackToLogin() {
        path.removeLast()
    }
}

extension BaseCoordinator: SettingsNavigator {
    func settingActionTnC() {
        presentSheetItem = .settingsTnC
    }
    
    func settingActionPnP() {
        fullCoverItem = .settingsPnP
    }
    
    func settingActionLogout() {
        self.initiateLogin()
    }
    
    func settingActionProfileDetail(user: Any) {
        path.append(DestinationFlowPage.profileDetail(user: user))
    }
    
}

/// Define enum to identify individualy navigation trigger point
enum DestinationFlowPage: Hashable, Identifiable {
    static func == (lhs: DestinationFlowPage, rhs: DestinationFlowPage) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    
    case login
    case signup
    case home
    case settings
    case settingsTnC
    case settingsPnP
    case profile
    case profileDetail(user: Any)
    case homeDetail
    case generalDetail(text: String)
    
    var id: String {
        String(describing: self)
    }
    
    func hash(into hasher: inout Hasher) {
        // Hashing logic based on the enum case
        switch self {
        case .home:
            hasher.combine("home")
        case .profile:
            hasher.combine("profile")
        case .settings:
            hasher.combine("settings")
        case .login:
            hasher.combine("login")
        case .signup:
            hasher.combine("signup")
        case .settingsTnC:
            hasher.combine("settingsTnC")
        case .settingsPnP:
            hasher.combine("settingsPnP")
        case .profileDetail(_):
            hasher.combine("profileDetail")
        case .homeDetail:
            hasher.combine("homeDetail")
        case .generalDetail(_):
            hasher.combine("generalDetail")
        }
    }
    
}

protocol AnyDataModel {
    var data: Any? { get set }
    var index: Int? { get set }
    var id: String? { get set }
}
