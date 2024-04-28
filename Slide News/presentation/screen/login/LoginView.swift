//
//  LoginView.swift
//  Slide News
//
//  Created by Aman Kumar on 28/04/24.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var viewModel: LoginViewModel
    @State var email: String = ""
    @State var password: String = ""
    @FocusState private var focusedTextField: FormTextField?
    @State var isSignUp: Bool = false
    
    enum FormTextField {
        case email, password
    }
    
    var body: some View {
        if viewModel.userSession != nil {
            MainTabView()
        } else {
            NavigationStack {
                ZStack {
                    Color.primaryTwo
                    
                    VStack(alignment: .leading) {
                        Spacer()
                        
                        Text("Hey,\nwelcome to")
                            .font(.outfitFont(.medium, fontSize: .heading))
                            .foregroundStyle(.black)
                            .padding(.horizontal)
                            .padding(.top, 40)
                        
                        Text("Slide News")
                            .font(.outfitFont(.medium, fontSize: .heading))
                            .foregroundStyle(.black)
                            .background(WaveUnderline())
                            .padding(.horizontal)
                        
                        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(.grayPrimary)
                                .shadow(color: .graySecondary, radius: 5, y: -1)
                            
                            VStack {
                                NavigationLink {
                                    MainTabView()
                                        .navigationBarBackButtonHidden()
                                } label: {
                                    Text("Skip")
                                        .font(.outfitFont(.regular, fontSize: .subHeadline))
                                        .underline()
                                        .frame(maxWidth: .infinity, alignment: .trailing)
                                        .foregroundStyle(.white)
                                        .padding(.horizontal, 30)
                                        .padding(.top, 20)
                                }
                                
                                InputView(
                                    text: $email,
                                    title: "Email Address",
                                    placeholder: "xyz@gmail.com"
                                )
                                .focused($focusedTextField, equals: .email)
                                .onSubmit {
                                    focusedTextField = .password
                                }
                                .submitLabel(.continue)
                                .padding(.top)
                                .padding(.horizontal)
                                
                                InputView(
                                    text: $password,
                                    title: "Password",
                                    placeholder: "*****",
                                    isSecureField: true
                                )
                                .focused($focusedTextField, equals: .password)
                                .onSubmit {
                                    focusedTextField = nil
                                }
                                .submitLabel(.done)
                                .padding(.horizontal)
                                
                                Button {
                                    
                                } label: {
                                    Text("Forgot password?")
                                        .font(.outfitFont(.bold, fontSize: .subHeadline))
                                        .foregroundStyle(.primaryTwo)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                }
                                .padding()
                                .opacity(isSignUp ? 0 : 1)
                                
                                
                                Button {
                                    Task {
                                        if isSignUp {
                                            try await viewModel.createUserAccount(withEmail: email, password: password)
                                        } else {
                                            try await viewModel.loginIn(withEmail: email, password: password)
                                        }
                                    }
                                } label: {
                                    LoginButton(
                                        name: isSignUp ? "SIGN UP" : "LOGIN",
                                        buttonColor: .primaryTwo,
                                        textColor: .black
                                    )
                                }
                                .disabled(!formIsValid)
                                .opacity(formIsValid ? 1.0 : 0.5)
                                .padding(.horizontal)
                                
                                Button {
                                    isSignUp.toggle()
                                } label: {
                                    HStack(spacing: 5) {
                                        Text(isSignUp ? "Already have an account?" : "Don't have an account?")
                                        
                                        Text(isSignUp ? "Login" : "Sign up")
                                            .foregroundStyle(.primaryTwo)
                                            .fontWeight(.bold)
                                    }
                                    .font(.outfitFont(.regular, fontSize: .subHeadline))
                                    .foregroundStyle(.white)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                }
                                .padding(.top)
                                .padding(.horizontal)
                                
                                HStack {
                                    VStack {
                                        Divider()
                                            .background(.primaryTwo)
                                    }
                                    
                                    Text("OR")
                                        .font(.outfitFont(.regular, fontSize: .subHeadline))
                                        .foregroundStyle(.primaryTwo)
                                    
                                    VStack {
                                        Divider()
                                            .background(.primaryTwo)
                                    }
                                }
                                .padding()
                                .opacity(isSignUp ? 0 : 1)
                                
                                Button {
                                    Task {
                                        try await viewModel.signInGoogle()
                                    }
                                } label: {
                                    GoogleButton(buttonColor: .primaryTwo, textColor: .primaryTwo)
                                }
                                .padding(.horizontal)
                                .opacity(isSignUp ? 0 : 1)
                                
                                Spacer()
                            }
                        }
                        
                    }
                }
                .ignoresSafeArea()
                .alert(item: $viewModel.alertItem) { alertItem in
                    Alert(title: alertItem.title,
                          message: alertItem.message,
                          dismissButton: alertItem.dismissButton)
                }
            }
        }
    }
}

#Preview {
    LoginView(email: "abc@gmail.com", password: "23423432").environmentObject(LoginViewModel())
}

extension LoginView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 5
    }
}
