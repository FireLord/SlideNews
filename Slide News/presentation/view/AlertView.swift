//
//  AlertView.swift
//  Slide News
//
//  Created by Aman Kumar on 23/04/24.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    // MARK: Network Alerts
    static let invalidData = AlertItem(title: Text("Server Error"),
                                       message: Text("The data received from the server was invalid. Please contact support"),
                                       dismissButton: .default(Text("OK")))
    
    static let invalidResponse = AlertItem(title: Text("Server Error"),
                                       message: Text("Invalid response from server. Please try again later or contact support"),
                                       dismissButton: .default(Text("OK")))
    
    static let invalidURL = AlertItem(title: Text("Server Error"),
                                       message: Text("There was an issue connecting to the server. Please contact support"),
                                       dismissButton: .default(Text("OK")))
    
    static let noInternetConnection = AlertItem(title: Text("Server Error"),
                                       message: Text("Make sure you are connected to internet"),
                                       dismissButton: .default(Text("OK")))
    
    // MARK: Account Alerts
    static let invalidForm = AlertItem(title: Text("Invalid Form"),
                                       message: Text("Please ensure all fields in the form have been filled out."),
                                       dismissButton: .default(Text("OK")))
    
    static let invalidEmail = AlertItem(title: Text("Invalid Email"),
                                       message: Text("Please ensure your email is correct."),
                                       dismissButton: .default(Text("OK")))
    
    static let userSaveSuccess = AlertItem(title: Text("Profile Saved"),
                                       message: Text("Your profile info was saved."),
                                       dismissButton: .default(Text("OK")))
    
    static let invalidUserData = AlertItem(title: Text("Profile Error"),
                                       message: Text("There was an error."),
                                       dismissButton: .default(Text("OK")))
    
    // MARK: Database Alerts
    static let dataSourceError = AlertItem(title: Text("Database Error"),
                                           message: Text("There was an error."),
                                           dismissButton: .default(Text("OK")))
    
    static let createError = AlertItem(title: Text("Database Error"),
                                           message: Text("There was error while saving data"),
                                           dismissButton: .default(Text("OK")))
    
    static let deleteError = AlertItem(title: Text("Database Error"),
                                           message: Text("There was error while deleting data"),
                                           dismissButton: .default(Text("OK")))
    
    static let updateError = AlertItem(title: Text("Database Error"),
                                           message: Text("There was error while updating data"),
                                           dismissButton: .default(Text("OK")))
    
    static let fetchError = AlertItem(title: Text("Database Error"),
                                           message: Text("There was error while fetching data"),
                                           dismissButton: .default(Text("OK")))
    
    // MARK: Login alerts
    static let loginError = AlertItem(title: Text("Login Error"),
                                    message: Text("There was an error."),
                                    dismissButton: .default(Text("OK")))
    
    static let invalidEmailError = AlertItem(title: Text("Login Error"),
                                    message: Text("There was an error finding your account"),
                                    dismissButton: .default(Text("OK")))
    
    static let userExistError = AlertItem(title: Text("Login Error"),
                                    message: Text("Account already exits"),
                                    dismissButton: .default(Text("OK")))
    
    static let wrongPasswordError = AlertItem(title: Text("Login Error"),
                                              message: Text("Wrong password. Please check or reset password"),
                                              dismissButton: .default(Text("OK")))
    
    static let passwordResetLink = Alert(title: Text("Mail Sent"),
                                         message: Text("Your password reset email has been sent."),
                                         dismissButton: .default(Text("OK")))
}
