//
//  ActivityLinkView.swift
//  Todo
//
//  Created by Brando Lugo on 1/27/21.
//

import SwiftUI

struct ActivityLinkView: View {
    @ObservedObject var activityManager: Activities
    @State var activityInstance: Activity

    var body: some View {
        VStack{
            Text(activityInstance.title)
            Text(activityInstance.description)
            Text("\(activityInstance.completion)")
            
            Button(action: {
                activityManager.increaseActivityCompletion(activityInstance: activityInstance)
            }, label: {
                Text("Button")
            })
        }
    }
}

struct ActivityLinkView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityLinkView(activityManager: Activities(), activityInstance: Activity(title: "Super", description: "Duper", completion: 1))
    }
}
