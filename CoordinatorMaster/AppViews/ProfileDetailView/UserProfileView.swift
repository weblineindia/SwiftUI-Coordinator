import Foundation
import SwiftUI

struct UserProfileView: View {

    @StateObject var viewModel: UserProfileViewModel
    
    var body: some View {
        content()
    }

    @ViewBuilder private func content() -> some View {
        ScrollView {
                VStack(alignment: .leading) {
                    Spacer(minLength: 20)
                    Image(uiImage: viewModel.getProfile())
                            .resizable()
                            .scaledToFit()
                            .background(Rectangle())
                            .cornerRadius(10)
                            .padding(.horizontal)
                            
                    Text("User: \(viewModel.getUserName())")
                        .font(.system(.title, design: .rounded, weight: .bold))
                        .padding(.horizontal, 20)
                    Spacer()
                }
                .padding(.horizontal)
                
        }
        .environmentObject(viewModel)
        .navigationTitle("Profile Detail")
        .setCustomNavigationBackButton(title: "", image: "") {}
    }
}
