//
//  ContentView.swift
//  SceneBasedStateRestoration-Article
//
//  Created by Vadym Bulavin on 10/29/19.
//  Copyright © 2019 Vadym Bulavin. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            NavigationLink(destination: TextInput()) {
                Text("Enter text")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
