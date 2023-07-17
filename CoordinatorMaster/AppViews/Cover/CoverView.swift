import SwiftUI

struct CoverView: View {

    @Environment(\.dismiss) private var dismiss

    @StateObject var viewModel: CoverViewModel

    var body: some View {
      content()
    }

    @ViewBuilder private func content() -> some View {
        ZStack {
            //Color.yellow.ignoresSafeArea()
            VStack {
                Text(viewModel.text)
                Button("Close", action: { dismiss() })
            }
        }
    }
}
