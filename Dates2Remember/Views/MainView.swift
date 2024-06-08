//
//  ContentView.swift
//  Dates2Remember
//
//  Created by Shamik Karkhanis on 5/30/24.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var viewModel = MainViewModel()
    
    var body: some View {
        
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty{
            accView
        } else {
            LoginView() 
        }
        
    }
    
    @ViewBuilder
    var accView: some View {
        TabView {
            EventItemsView(userId: viewModel.currentUserId)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
        }
    }
}

#Preview {
    MainView()
}
