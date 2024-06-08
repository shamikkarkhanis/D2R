//
//  Dates2RememberApp.swift
//  Dates2Remember
//
//  Created by Shamik Karkhanis on 5/30/24.
//

import FirebaseCore
import SwiftUI

@main
struct Dates2RememberApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
