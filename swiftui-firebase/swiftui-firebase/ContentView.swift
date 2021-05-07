//
//  ContentView.swift
//  swiftui-firebase
//
//  Created by Cédric Bahirwe on 06/05/2021.
//

import SwiftUI
import FirebaseAuth

class AppViewModel: ObservableObject {
    
    enum SignAction: Hashable {
        case signIn, signUp
    }
    let auth = Auth.auth()
    @Published var signedIn: Bool = false
    @Published var signingAction:SignAction? = .signIn
    var isSignedIn: Bool {
        auth.currentUser != nil
    }
    
    func signIn(email: String, password: String) {
        auth.signIn(withEmail: email, password: password) { [weak self] (result, error) in
            print(email, password)
            guard result != nil , error == nil else { return }
            // Success
            
            DispatchQueue.main.async {
                self?.signedIn = true
            }
        }
    }
    
    func signUp(email: String, password: String) {
        auth.createUser(withEmail: email, password: password) { [weak self] (result, error) in
            guard result != nil , error == nil else { return }
            // Success
            
            DispatchQueue.main.async {
                self?.signedIn = true
            }
        }
    }
    
    func signOut() {
        try? auth.signOut()
        signedIn = false
    }
}

struct ContentView: View {
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        NavigationView {
            if viewModel.signedIn {
                VStack {
                    Text("You are signed in")
                    Text("Sign out")
                        .foregroundColor(.red)
                        .onTapGesture(perform:viewModel.signOut)
                }
            } else {
                SignInView()
            }
        }
        .onAppear {
            viewModel.signedIn = viewModel.isSignedIn
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}

struct SignInView: View {
    @EnvironmentObject var viewModel: AppViewModel
    
    @State private var email: String = ""
    @State private var password: String = ""
    var body: some View {
        VStack {
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 100)
            
            
            VStack {
                TextField("Email", text: $email)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(8)
                SecureField("Password", text: $password)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(8)
                
                Button(action: {
                    if viewModel.signingAction == .signIn {
                        viewModel.signIn(email: email, password: password)
                    } else {
                        viewModel.signUp(email: email, password: password)
                    }
                }) {
                    Text(viewModel.signingAction == .signIn ? "Sign In" : "Create Account")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(8)
                }
                
                NavigationLink("", destination: SignInView(), tag: AppViewModel.SignAction.signUp, selection: $viewModel.signingAction)
                Text(viewModel.signingAction == .signIn ? "Create account" : "Log In")
                    .onTapGesture {
                        viewModel.signingAction = viewModel.signingAction == .signUp ? .signIn : .signUp
                    }
            }
            .padding()
            Spacer()
            
        }
        .navigationTitle(viewModel.signingAction == .signIn ? "Sign In" : "Sign Up")
    }
}
