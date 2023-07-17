import Foundation
import SwiftUI
import Combine

final class HomeViewModel: ObservableObject {
    
    @Published private(set) var state = HomeApiState.idle
    // MARK: - Properties
    
    enum HomeApiState {
        case idle
        case loading
        case failed(ErrorType)
        case success([UserModel])
    }
    
    /// -------------API CALLING ----------------------------
    
    func setHomeApiState(stat: HomeApiState = .idle) {
        self.state = stat
    }
    
    func fetchData() {
        let response = [ UserModel.init(id: 1, user: "User1", text: "Detail 1"),
                         UserModel.init(id: 2, user: "User2", text: "Detail 2"),
                         UserModel.init(id: 3, user: "User3", text: "Detail 3"),
                         UserModel.init(id: 4, user: "User4", text: "Detail 4"),
                         UserModel.init(id: 5, user: "User5", text: "Detail 5"),
                        ]
        self.state = .success(response)
    }
    
}
