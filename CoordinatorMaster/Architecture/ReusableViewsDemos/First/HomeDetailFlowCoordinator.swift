import SwiftUI

enum HomeDetailLink: Hashable, Identifiable {
    case link

    var id: String {
        String(describing: self)
    }
}

open class HomeDetailFlowState: ObservableObject {

    @Published var presentedItem: HomeDetailLink?

    @Binding var path: NavigationPath

    init(path: Binding<NavigationPath>) {
        _path = path
    }
}

struct HomeDetailFlowCoordinator<Content: View>: View {

    @ObservedObject var state: HomeDetailFlowState
    let content: () -> Content

    var body: some View {
        content()
            .sheet(item: $state.presentedItem, content: sheetContent)
            .navigationDestination(for: HomeDetailLink.self, destination: linkDestination)
    }

    @ViewBuilder private func linkDestination(link: HomeDetailLink) -> some View {
        EmptyView()
    }

    @ViewBuilder private func sheetContent(item: HomeDetailLink) -> some View {
        EmptyView()
    }
}
