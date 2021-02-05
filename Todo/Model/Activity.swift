//
//  Activity.swift
//  Todo
//
//  Created by Brando Lugo on 1/25/21.
//

import Foundation

//Model
struct Activity: Identifiable, Codable {
    var id = UUID()
    var title: String
    var description: String
    var completion: Int
    
    mutating func activityCompleted() {
        completion += 1
    }
}
