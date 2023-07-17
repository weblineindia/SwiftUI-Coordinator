import Foundation
import SwiftUI

final class UserProfileViewModel: ObservableObject {
     var getData: Any
  
    init(data: Any?) {
        getData = data as Any
    }
    
    func getUserName() -> String {
        if let user = UserDefaults.standard.string(forKey: "userName"), user.count > 0 {
            return user
        } else if let data = getData as? String {
            print("data pass string", data)
            return data
        } else if let data = getData as? UserModel {
            return data.user
        } else if let data = getData as? [Any], let name = data.first as? String {
            return name
        }
        return ""
    }
    func getProfile() -> UIImage {
        if let data = getData as? [Any], let profile = data.last as? UIImage {
            return profile
        }
        return UIImage()
    }
}
