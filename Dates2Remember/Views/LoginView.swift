//
//  LoginView.swift
//  Dates2Remember
//
//  Created by Shamik Karkhanis on 6/3/24.
//

import SwiftUI



struct LoginView: View {
    
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                //logo
                Text("D2R")
                    .font(.system(size: 70, weight: .light))
                Text("dates to remember")
                
                
                
                //input (phone num)
                Form {
                    TextField("Email", text: $viewModel.email)
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                        .textFieldStyle(DefaultTextFieldStyle())
                    SecureField("Password", text: $viewModel.password)
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
    
                    
                    
                    Button {
                        viewModel.login()
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                .foregroundColor(.red)
                            
                            Text("Login")
                                .foregroundColor(.white)
                                    
                        }
                        
                    }
                    
                    if !viewModel.errmessage.isEmpty {
                        Text(viewModel.errmessage)
                            .foregroundColor(Color.red)
                    }
                    
                    
                }
                
                
                
                
                Spacer()
                
                NavigationLink("Create Account", destination: RegisterView())
                
            }
            
        }
        
    }
}

#Preview {
    LoginView()
}
