import SwiftUI

struct SignUpView: View {
    @EnvironmentObject var coordinator: BaseCoordinator
    @ObservedObject var viewModel: SignupViewModel
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                Spacer()
                Text("Register").font(.largeTitle)
                    .foregroundColor(.purple)
                
                VStack(alignment: .leading) {
                    TextField("UserName", text: $viewModel.userName).padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                }
                
                VStack(alignment: .leading) {
                    TextField("Email", text: $viewModel.email).padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                }
                
                VStack(alignment: .leading) {
                    TextField("Password", text: $viewModel.password).padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                }
                
                HStack {
                    AppButtonView(title: "Login") {
                        login()
                    }
                    Spacer()
                    AppButtonView(title: "Register") {
                        self.createAccount()
                    }
                }
                
            }.padding()
                .navigationBarBackButtonHidden()
        }
        
    }
    
    func createAccount() {
        viewModel.validate()
    }
    func login() {
        coordinator.signupActionBackToLogin()
    }
    
}

//struct ContentViePreviewsTest: PreviewProvider {
//    static var previews: some View {
//        SignUpView(viewModel: SignupViewModel())
//    }
//}

struct AppButtonView: View {
    var title: String
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .foregroundColor(.white)
                .padding()
                .background(Color.blue)
                .cornerRadius(10)
        }
    }
}
