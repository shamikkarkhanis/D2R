//
//  SwiftUIView.swift
//  Dates2Remember
//
//  Created by Shamik Karkhanis on 6/3/24.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Button {
                    viewModel.signOut()
                } label: {
                    Text("Sign Out")
                }
            }
            .navigationTitle("Profile")
        }
    }
}

#Preview {
    ProfileView()
}
