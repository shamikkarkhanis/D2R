//
//  RegisterView.swift
//  Dates2Remember
//
//  Created by Shamik Karkhanis on 6/4/24.
//

import SwiftUI

struct RegisterView: View {
    
    @StateObject var viewModel = RegisterViewModel()
    
    var body: some View {
        
            VStack {
                
                //logo
                Text("D2R")
                    .font(.system(size: 70, weight: .light))
                Text("dates to remember")
                
                
                
                //input (phone num)
                Form {
                    TextField("Full Name", text: $viewModel.name)
                        .autocorrectionDisabled()
                        .textFieldStyle(DefaultTextFieldStyle())
                    TextField("Email", text: $viewModel.email)
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                        .textFieldStyle(DefaultTextFieldStyle())
                    SecureField("Password", text: $viewModel.pass)
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    Button {
                        viewModel.register()
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                .foregroundColor(.red)
                            
                            Text("Create Account")
                                .foregroundColor(.white)
                                    
                        }
                        
                    }
                    
                    if !viewModel.errmessage.isEmpty {
                        Text(viewModel.errmessage)
                            .foregroundColor(Color.red)
                    }
                    
                }
                

                
            }
            
        }
        
}

#Preview {
    RegisterView()
}
