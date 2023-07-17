import Foundation
import SwiftUI

class SignupViewModel: ObservableObject {
    @Published var userName = ""
    @Published var email = ""
    @Published var password = ""
    
    func validate() {
    }
}
