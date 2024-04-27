//
//  LoginView.swift
//  Slide News
//
//  Created by Aman Kumar on 28/04/24.
//

import SwiftUI

struct LoginView: View {
    @State var email: String = ""
    @State var password: String = ""
    @FocusState private var focusedTextField: FormTextField?
    
    enum FormTextField {
        case email, password
    }
    
    var body: some View {
        ZStack {
            Color.primaryTwo
            
            VStack(alignment: .leading) {
                Spacer()
                
                Text("Hey,\nWelcome To\nSlide News")
                    .font(.outfitFont(.medium, fontSize: .heading))
                    .foregroundStyle(.black)
                    .padding()
                    .padding(.top, 40)
                
                ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.grayPrimary)
                        .shadow(radius: 10, y: -10)
                    
                    VStack {
                        Button {
                            print("hi")
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
                            LoginButton(name: "LOGIN IN")
                        }
                        .padding(.horizontal)
                        
                        Button {
                            
                        } label: {
                            LoginButton(name: "GOOGLE SIGN IN")
                        }
                        .padding(.horizontal)
                        
                        
                        Button {
                            print("hi")
                        } label: {
                            HStack(spacing: 5) {
                                Text("Don't have an account?")
                                Text("Sign up")
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

#Preview {
    LoginView(email: "abc@gmail.com", password: "23423432")
}
