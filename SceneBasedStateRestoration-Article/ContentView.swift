//
//  ContentView.swift
//  SceneBasedStateRestoration-Article
//
//  Created by Vadym Bulavin on 10/29/19.
//  Copyright © 2019 Vadym Bulavin. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var state: AppState

    var body: some View {
        NavigationView {
            NavigationLink(destination: EditText(text: $state.text), isActive: $state.isEditing) {
                Text("Edit")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        return ContentView(state: appState)
    }
}
