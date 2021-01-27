//
//  ContentView.swift
//  Todo
//
//  Created by Brando Lugo on 1/23/21.
//

import SwiftUI

//View
struct ActivityView: View {
    
    @ObservedObject var activityManager: Activities
    
    var body: some View {
        NavigationView {
            ZStack {
            List {
                ForEach(activityManager.activities) {activity in
                    NavigationLink(
                        destination: Text("Destination \(activity.title)"),
                        label: {
                            VStack(alignment: .leading) {
                                Text(activity.title)
                                    .font(.headline)
                                Text(activity.description)
                                    .foregroundColor(.gray)
                                    .font(.subheadline)
                                    
                            }
                        })
                }
                .onDelete(perform: { indexSet in
                    for index in indexSet {
                        activityManager.remove(index: index)
                    }
                })
                .onMove(perform: { indices, newOffset in
                    activityManager.move(indices: indices, newOffset: newOffset)
                })
            }
                if activityManager.activities.count == 0 {
                    Text("Please add new activity")
                        .foregroundColor(.gray)
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("Todo List")
            .toolbar(content: {
                ToolbarItemGroup(placement: .navigationBarTrailing, content: {
                    EditButton()
                    Button(action: {
                        activityManager.addActivity()
                    }, label: {
                        Image(systemName: "doc.badge.plus")
                    })
                })
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            ActivityView(activityManager: Activities.fullState())
                .previewDisplayName("Full")
            ActivityView(activityManager: Activities.emptyState())
                .previewDisplayName("Empty")
        }
        
    }
}
