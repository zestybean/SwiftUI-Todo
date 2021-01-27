//
//  Activities.swift
//  Todo
//
//  Created by Brando Lugo on 1/25/21.
//

import Foundation

//ViewModel
class Activities: ObservableObject {
    @Published var activities = [Activity](){
        didSet {
            let encoder = JSONEncoder()
            
            if let encoded = try? encoder.encode(activities) {
                UserDefaults.standard.set(encoded, forKey: "Activities")
            }
        }
    }
    
    init(isForTest: Bool = false) {
        
        if isForTest == false {
            if let activities = UserDefaults.standard.data(forKey: "Activities") {
                let decoder = JSONDecoder()
                
                if let decoded = try? decoder.decode([Activity].self, from: activities) {
                    self.activities = decoded
                    return
                }
                
                self.activities = []
            }
        }
        
    }
    
    //MARK: Intents
    func move(indices: IndexSet, newOffset: Int) {
        activities.move(fromOffsets: indices, toOffset: newOffset)
    }
    
    func remove(index: Int) {
        activities.remove(at: index)
    }
    
    func addActivity() {
        activities.append(Activity(title: "New"))
    }
    
    static func emptyState() -> Activities {
        let manager = Activities(isForTest: true)
        manager.activities = []
        return manager
    }
    
    static func fullState() -> Activities {
        let manager = Activities(isForTest: true)
        manager.activities = [Activity(title: "Full"), Activity(title:"State")]
        return manager
    }
}
