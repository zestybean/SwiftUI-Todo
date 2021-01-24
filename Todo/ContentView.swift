//
//  ContentView.swift
//  Todo
//
//  Created by Brando Lugo on 1/23/21.
//

import SwiftUI

//Model
struct Activity: Identifiable, Codable {
    var id = UUID()
    var title: String
}

//ViewModel
class Activities: ObservableObject {
    @Published var activities = [Activity]()
}

//View
struct ContentView: View {
    
    @State var items = [Activity(title: "First"), Activity(title: "Second"), Activity(title: "Third")]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(items) {item in
                    VStack(alignment: .leading) {
                        Text(item.title)
                            .font(.headline)
                        Text(item.id.description)
                            .font(.subheadline)
                    }
                }
                .onDelete(perform: { indexSet in
                    for index in indexSet {
                        items.remove(at: index)
                    }
                })
                .onMove(perform: { indices, newOffset in
                    items.move(fromOffsets: indices, toOffset: newOffset)
                })
            }
            .navigationTitle("Todo List")
            .toolbar(content: {
                ToolbarItemGroup(placement: .navigationBarTrailing, content: {
                    EditButton()
                    Button(action: {
                        items.append(Activity(title: "New"))
                    }, label: {
                        Image(systemName: "pencil")
                    })
                })
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
