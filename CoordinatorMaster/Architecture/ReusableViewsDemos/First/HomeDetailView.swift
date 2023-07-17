import SwiftUI

struct HomeDetailView: View {
    
    @StateObject var viewModel: HomeDetailViewModel
    
    var body: some View {
        HomeDetailFlowCoordinator(state: viewModel, content: content)
    }
    
    @ViewBuilder private func content() -> some View {
        ZStack {
            Color.white.ignoresSafeArea()
            Text(viewModel.text)
        }.navigationTitle("Detail")
            .setCustomNavigationBackButton(title: "", image: "") {
                print("back tap")
            }
           // .toolbarRole(.editor)
    }
}
