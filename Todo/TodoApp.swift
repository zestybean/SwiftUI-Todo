//
//  TodoApp.swift
//  Todo
//
//  Created by Brando Lugo on 1/23/21.
//

import SwiftUI

@main
struct TodoApp: App {
    
    @StateObject var activitiesManager = Activities()
    
    var body: some Scene {
        WindowGroup {
            ActivityView(activityManager: activitiesManager)
        }
    }
}
