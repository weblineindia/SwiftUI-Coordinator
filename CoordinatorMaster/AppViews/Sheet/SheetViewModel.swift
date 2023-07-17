import Foundation

final class SheetViewModel: ObservableObject {

    let text: String

    init(text: String) {
        self.text = text
    }
}
