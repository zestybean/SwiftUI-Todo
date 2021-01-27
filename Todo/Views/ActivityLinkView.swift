//
//  ActivityLinkView.swift
//  Todo
//
//  Created by Brando Lugo on 1/27/21.
//

import SwiftUI

struct ActivityLinkView: View {
    @ObservedObject var activityManager: Activities
    var activityInstance: Activity

    var body: some View {
        Text(activityInstance.title)
       
    }
}

struct ActivityLinkView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityLinkView(activityManager: Activities(), activityInstance: Activity(title: "Test", description: "Test", completion: 1))
    }
}
