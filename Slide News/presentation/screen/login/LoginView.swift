//
//  LoginView.swift
//  Slide News
//
//  Created by Aman Kumar on 28/04/24.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()
    @State var email: String = ""
    @State var password: String = ""
    @FocusState private var focusedTextField: FormTextField?
    @State var isSignUp: Bool = false
    
    enum FormTextField {
        case email, password
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.primaryTwo
                
                VStack(alignment: .leading) {
                    Spacer()
                    
                    Text("Hey,\nwelcome to\nSlide News")
                        .font(.outfitFont(.medium, fontSize: .heading))
                        .foregroundStyle(.black)
                        .padding()
                        .padding(.top, 40)
                    
                    ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.grayPrimary)
                            .shadow(radius: 10, y: -10)
                        
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
                                    .padding(.top, 30)
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
                            .padding()
                            
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
                            .padding()
                            
                            Button {
                                
                            } label: {
                                LoginButton(name: isSignUp ? "SIGN UP" : "LOGIN IN")
                            }
                            .disabled(!formIsValid)
                            .opacity(formIsValid ? 1.0 : 0.5)
                            .padding(.horizontal)
                            
                            Button {
                                Task {
                                    try await viewModel.signInGoogle()
                                }
                            } label: {
                                LoginButton(name: "CONTINUE WITH GOOGLE")
                            }
                            .padding(.horizontal)
                            .opacity(isSignUp ? 0 : 1)
                            
                            
                            Button {
                                isSignUp.toggle()
                            } label: {
                                HStack(spacing: 5) {
                                    Text(isSignUp ? "Already have an account?" : "Don't have an account?")
                                    Text(isSignUp ? "Login" : "Sign up")
                                        .fontWeight(.bold)
                                }
                                .font(.outfitFont(.regular, fontSize: .subHeadline))
                                .foregroundStyle(.white)
                            }
                            .padding()
                            
                            Spacer()
                        }
                    }
                    
                }
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    LoginView(email: "abc@gmail.com", password: "23423432")
}

extension LoginView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 5
    }
}
