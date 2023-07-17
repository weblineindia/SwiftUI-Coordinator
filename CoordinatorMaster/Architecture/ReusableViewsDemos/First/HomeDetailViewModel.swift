import SwiftUI

final class HomeDetailViewModel: HomeDetailFlowState {

    @Published var text: String

    init(path: Binding<NavigationPath>, text: String?) {
        if let text = text {
            self.text = "\(text)"
        } else {
            self.text = ""
        }

        super.init(path: path)
    }
}
