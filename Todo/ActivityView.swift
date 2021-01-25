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
            List {
                ForEach(activityManager.activities) {item in
                    NavigationLink(
                        destination: Text("Destination \(item.title)"),
                        label: {
                            VStack(alignment: .leading) {
                                Text(item.title)
                                    .font(.headline)
                                Text(item.id.description)
                                    .font(.subheadline)
                            }
                        })
                }
                .onDelete(perform: { indexSet in
                    for index in indexSet {
                        activityManager.activities.remove(at: index)
                    }
                })
                .onMove(perform: { indices, newOffset in
                    activityManager.move(indices: indices, newOffset: newOffset)
                })
            }
            .navigationTitle("Todo List")
            .toolbar(content: {
                ToolbarItemGroup(placement: .navigationBarTrailing, content: {
                    EditButton()
                    Button(action: {
                        activityManager.activities.append(Activity(title: "New"))
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
        ActivityView(activityManager: Activities())
    }
}
