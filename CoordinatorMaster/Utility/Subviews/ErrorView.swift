//
//  ErrorView.swift
//  GitHubSearch
//
//  Created by Lukasz Dziwosz on 08/08/2022.
//

import SwiftUI

enum ErrorType {
    case decoding
    case noInternet
    case backend(Int)
    case custom(String)
}

struct ErrorView: View {
    
    let error: ErrorType
    
    var body: some View {
        VStack {
            Text("Something went wrong")
                .font(.title)
                .padding()
            Group {
                switch error {
                case .decoding:
                    Text("Please contact developer")
                case .noInternet:
                    Text("Please check your internet connection")
                case .custom(let err):
                    Text(err)
                case .backend(let code):
                    switch code {
                    case 403:
                        Text("Github API limit reached, wait a second")
                    case 503:
                        Text("Service unavailable")
                    default:
                        Text("Server error code: \(code)")
                    }
                }
            }
            .padding()
        }
    }
}

//struct ErrorView_Previews: PreviewProvider {
//    static var previews: some View {
//        ErrorView()
//    }
//}
